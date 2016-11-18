require 'rails_helper'
require 'spec_helper'


describe Product do
    before(:each) do
      @c1 = Cart.new
      @p1 = Product.create!(name: 'Test1', description: 'desc', price: 2)
      @p2 = Product.create!(name: 'Test2', description: 'desc', price: 4)
    end

    let(:add_products_to_cart) {@c1.products << Product.find(@p1.id) << Product.find(@p2.id) && @c1.save}

  describe '.adding' do
    it 'add products to cart' do
      # binding.pry;
      expect{add_products_to_cart}.to change{@c1.products.count}.by(2)
    end

    it 'raise an error wrong id' do
      expect { @c1.products << Product.find('34r3432') }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'raise an error adding nil product' do
      expect { @c1.products << Product.find() }.to raise_error(ActiveRecord::RecordNotFound)
    end

    it 'calc sum price' do
      add_products_to_cart
      expect(@c1.products.sum("price")).to eql 6.0
    end

    it '.delete proodut' do
      add_products_to_cart
      @c1.products.find(@p1.id).delete
      expect(@c1.products.all.where(id: "#{@p1.id}")).to be_empty
      expect(@c1.products.all.where(id: "#{@p2.id}")).to exist
    end
  end
end