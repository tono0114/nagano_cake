Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    devise_for :admins, path: "/", controllers: {
      sessions: 'admin/sessions'
    }
    get 'homes/top' => 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end

  namespace :public do
    root to:'homes#top'
    get 'homes/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resource :customers, except: [:create, :destroy]
    resources :cart_items, except: [:new, :show]
    resources :orders, except: [:update, :destroy]
    resources :addresses, except: [:new, :show]
  end

end
