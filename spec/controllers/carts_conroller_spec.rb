require 'rails_helper'
require 'spec_helper'

describe CartsController do
  describe 'show' do
    before do
      get :show
    end
    it 'Returns OK' do
      expect(response).to be_ok
    end

    it 'Return text/html  format' do
      expect(response.content_type).to eq "text/html"
    end

    it 'Return 200' do
      binding.pry;
      expect(response.status).to eql 200
      expect(response.content_type).to eq "text/html"
    end

    it 'Return empty cart' do
      expect(response.body).to eq ""
    end
  end


  describe 'add' do
    let(:create) do
      post "products#create", controller => "prodcucts", name: 'Prod2', description: 'Prod2 descr',
           price: 12
    end

    it 'create product' do
      expect{create}.to change{Product.count}.by(1)
    end
  end

  # describe '#create' do
  #   let(:create) do
  #     post :create, name: 'Prod2', description: 'Prod2 descr',
  #          price: 12
  #   end
  #
  #   it 'Creates product' do
  #     expect{create}.to change{Product.count}.by(1)
  #     expect(Product.last.name).to eq 'Prod2'
  #     expect(Product.last.description).to eq 'Prod2 descr'
  #     expect(Product.last.price).to eq 12
  #     require 'pry'; binding.pry;
  #
  #   end
  #
  #   it 'get all products' do
  #     get '/products'
  #     expect(response).to be_ok
  #   end
  # end
end