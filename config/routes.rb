Rails.application.routes.draw do
  scope :portfolio_1 do
    root 'home#top'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
