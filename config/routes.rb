Rails.application.routes.draw do
  resources :extras
  resources :tapiceria
  resources :modelos
  resources :colors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "modelos#index"
end
