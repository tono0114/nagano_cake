Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    root_to:'homes#top'
    resources :sessions, only: [:new, :create, :destroy]
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end
  
  namespace :public do
    resources :homes, only: [:top, :about]
    resources :items, only: [:index, :show]
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resource :customers, except: [:create, :destroy]
    resources :cart_items, except: [:new, :show]
    resources :orders, except: [:update, :destroy]
    resources :addresses, except: [:new, :show]
  end
  
end
