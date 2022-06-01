Rails.application.routes.draw do
  scope :portfolio_1 do
    root 'home#top'
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
    resources :reviews, only: [:index, :new, :create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
