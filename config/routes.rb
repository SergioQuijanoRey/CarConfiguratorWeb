Rails.application.routes.draw do
  resources :extras
  resources :tapiceria
  resources :modelos
  resources :colors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/inicio/index', to: 'inicio#index', as: "home"

  # Defines the root path route ("/")
  root "inicio#index"
end
