Rails.application.routes.draw do
  get 'carts/show'

  # get 'products/index'

  root :to => redirect('/products')
  resources :products, only: [:index, :new, :create, :show, :destroy]

  resource :cart, only: [:show] do
    get :add, on: :member
  end
  # only=>index
  # {only: :index}
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
