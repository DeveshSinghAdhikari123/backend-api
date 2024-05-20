Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:create], defaults: {format: 'json'}
  resources :registrations, only: [:create]
  root "home#static"

end
