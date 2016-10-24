Rails.application.routes.draw do
  # get 'products/index'

  resources :products, only: [:index, :new, :create]
  # only=>index
  # {only: :index}
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
