Luckycharms::Application.routes.draw do
  root to: 'high_voltage/pages#show', id: 'welcome'

  resources :registrations, only: [:create]
  resources :api_keys, only: [:show]

  resources :units, only: [] do
    resource :current_url, only: [:show]
  end

  namespace :admin do
    resources :bookmarks, only: [:index, :create]
    resources :units, only: [:index] do
      resource :current_url, only: [:create]
    end
  end
end
