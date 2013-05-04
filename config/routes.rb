Luckycharms::Application.routes.draw do
  resources :registrations, only: [:create]
  resources :api_keys, only: [:show]
  resources :units, only: [] do
    resource :current_url, only: [:show]
  end
end
