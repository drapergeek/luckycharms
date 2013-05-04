Luckycharms::Application.routes.draw do
  resources :registrations, only: [:create]
  resources :api_keys, only: [:show]
end
