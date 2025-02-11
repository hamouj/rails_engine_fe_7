Rails.application.routes.draw do

  root 'welcome#index'

  resources :merchants, only: [:index, :show], param: :merchant_id
  resources :items, only: [:index, :show], param: :item_id
end
