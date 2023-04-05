Rails.application.routes.draw do
  resources :merchants, only: [:index, :show]
end
