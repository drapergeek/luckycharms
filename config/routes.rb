Luckycharms::Application.routes.draw do
  resources :registrations, only: [:create]
  resources :api_keys, only: [:show]

  resources :units, only: [] do
    resource :current_url, only: [:show]
  end

  namespace :admin do
    namespace :api do
      resource :bookmarks, only: [:create]
      resources :units, only: [] do
        resource :current_url, only: [:create]
      end
    end
  end
end
