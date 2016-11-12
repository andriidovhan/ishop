Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  get 'carts/show'
  # get 'products/index'

  root :to => redirect('/products')
  resources :products, only: [:index, :new, :create, :show, :destroy]

  resource :cart, only: [:show] do
    get :add, on: :member
    delete :destroy
    # get :order_send, to: 'carts#order_send', as: :order_send
    post :order_send, to: 'carts#order_send', as: :order_send
  end
  # only=>index
  # {only: :index}
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
