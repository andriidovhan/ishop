require 'rails_helper'
require 'spec_helper'


describe Product do
  before(:all) do
    @c1 = Cart.new
    @p1 = Product.create!(name: 'Test1', description: 'desc', price: 2)
    @p2 = Product.create!(name: 'Test2', description: 'desc', price: 4)
  end

  let(:add_products_to_cart) {@c1.products << Product.find(@p1.id) << Product.find(@p2.id) && @c1.save}

  describe 'adding' do
    it 'add products to cart' do
      expect{add_products_to_cart}.to change{@c1.products.count}.by(2)
    end

    it 'calc sum price' do
      add_products_to_cart
      expect(@c1.products.sum("price")).to eql 6.0
    end
  end

  describe 'deleting' do
    it 'delete product' do
      binding.pry;
      expect{@c1.products.find(@p1.id).delete}.to change{Product.count}.by(-1)
    end

    it 'make sure the needed product has been deleted' do
      expect(@c1.products.include? @p1.id).to eql false
      expect(@c1.products.include? @p2.id).to eql true
    end
  end
end