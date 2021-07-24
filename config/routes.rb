Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do

    get 'homes/top' => 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show, :destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end

  devise_for :admins, controllers: {
      sessions: 'admin/sessions'
    }

  namespace :public do
    root to:'homes#top'
    get 'homes/about' => 'homes#about'
    resources :items, only: [:index, :show]
    resource :customers, except: [:create, :destroy]
    resources :cart_items, except: [:new, :show]
    resources :orders, except: [:update, :destroy]
    resources :addresses, except: [:new, :show]
  end
  
  devise_for :publics, controllers: {
    registrations: 'public/registrations'
    sessions: 'public/sessions'
  }

end
