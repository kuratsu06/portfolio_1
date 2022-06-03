Rails.application.routes.draw do
  scope :portfolio_1 do
    root 'home#top'
    get '/plofile', to: 'home#plofile'
    get '/bookmark', to: 'home#bookmark'
    devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions',
    }
    devise_scope :user do
      get 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    end
    resources :products do
      resource :favorites, only: [:create, :destroy]
    end
    get '/my_cart', to: 'carts#show'
    post '/add_item', to: 'carts#create'
    post '/update_item', to: 'carts#update'
    delete '/delete_item', to: 'carts#destroy'
    resources :reviews, only: [:index, :new, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
