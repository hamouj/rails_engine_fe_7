Rails.application.routes.draw do
  resources :merchants, only: [:index, :show], param: :merchant_id
  resources :items, only: [:show], param: :item_id
end
