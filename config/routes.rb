Rails.application.routes.draw do
  # get 'products/index'

  root :to => redirect('/products')
  resources :products, only: [:index, :new, :create, :show, :destroy]
  # only=>index
  # {only: :index}
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
