Rails.application.routes.draw do
  resources :park_images
  resources :users
  resources :favorites
  resources :events
  resources :parks
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
