Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :admins, controllers: {
      sessions: 'admin/sessions'
    }

  namespace :admin do

    get 'homes/top' => 'homes#top'
    resources :items, except: [:destroy]
    resources :genres, except: [:new, :show]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]

  end

  devise_for :customers, controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions'
    }

  namespace :public do

    root to:'homes#top'
    get 'homes/about' => 'homes#about'

    resources :items, only: [:index, :show]

    resource :customers, only: [:edit, :update]
    get 'customers/mypage' => 'customers#show'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdrawal' => 'customers#withdrawal'
    resources :cart_items do
      collection do
        delete 'destroy_all'
      end
    end

    get 'orders/complete' => 'orders#complete'
    resources :orders, except: [:update, :destroy]
    post 'orders/confirm' => 'orders#confirm'


    resources :addresses, except: [:new, :show]

  end

end
