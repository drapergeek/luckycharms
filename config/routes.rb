Luckycharms::Application.routes.draw do
  resources :registrations, only: [:create]
end
