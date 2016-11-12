require 'rails_helper'
require 'spec_helper'

describe ProductsController do
  describe '#index' do
    before do
      get :index
    end

    it 'Returns OK' do
      expect(response).to be_ok
    end

    it 'Return text/html  format' do
      expect(response.content_type).to eq "text/html"
    end

    it 'Return 200' do
      expect(response.status).to eql 200
    end

    it 'Right content type' do
      expect(response.content_type).to eq "text/html"
    end

    it 'Return empty body' do
      expect(response.body).to eq ""
    end
  end

  describe 'new' do
    before(:each) do
      get :new
    end
    it 'Returns OK' do
      expect(response).to be_ok
    end

    it 'Return text/html  format' do
      expect(response.content_type).to eq "text/html"
    end

    it 'Return 200' do
      expect(response.status).to eql 200
      expect(response.content_type).to eq "text/html"
    end

    it 'Return empty cart' do
      expect(response.body).to eq ""
    end
  end

  describe '#create' do
    let(:create) do
      post :create, name: 'Prod2', description: 'Prod2 descr',
           price: 12
    end

    it 'Create product' do
      expect{create}.to change{Product.count}.by(1)
      expect(Product.last.name).to eq 'Prod2'
      expect(Product.last.description).to eq 'Prod2 descr'
      expect(Product.last.price).to eq 12
      #test redirect after creating new product
      expect(response).to have_http_status(:found)
      expect(response).to redirect_to('/products')
      expect(response.body).to include("<html><body>You are being <a href=\"http://test.host/products\">redirected</a>.</body></html>")
      expect(response).should redirect_to '/products'
    end
  end

  describe 'redirect to products' do
    it 'root route redirect' do
      # expect(:get => "product_path"+"/#{Product.first.id}").to be_ok
      # expect(:get => "/").not_to be_routable
      # expect(:get => "root").to route_to(:controller => "products")
      # expect(:get => "/").not_to be_routable
      get root_path
      expect(response.status).to eql 302
    end
  end

  describe 'show specific product' do
    # it 'show product' do
    #   get product_path(Product.first.id.to_i)
    #   expect(response).to be_ok
    # end
    #pry> expect(:get => root_path).to route_to(:controller => "products", :action => "show")
    # RSpec::Expectations::ExpectationNotMetError: No route matches "/"
  end

#   describe 'delete' do
#     let(:create) do
#       post :create, name: 'Prod222', description: 'Prod2 descr',
#            price: 12
#     end
#
#     let(:destroy) do
#       delete :destroy[id: "#{Product.last.id}"]
#     end
#     it 'delete product' do
#       expect{create}.to change{Product.count}.by(1)
#       # delete "products/#{Product.last.id}"
#       # No route matches {:action=>"products/367", :controller=>"products"}
#       binding.pry;
#     end
#   end
end