class ProductsController < ApplicationController
  def index
    @products = Product.all

    # render '/products/lol'
  end

  def new
    @product = Product.new
  end

  def create
    Product.create(product_params)
    flash[:notice] = 'Product has been successfully created.'
    redirect_to products_path
    # , success: 'Product has been successfully added.'
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    # @product.destroy
    Product.find(params[:id]).destroy
    # flash[:alert] = 'Product has been successfully destroyed.'
    redirect_to products_path, alert: 'Product has been successfully destroyed.'
  end

  private
  def product_params
    # params.require('product').permit('name', 'price', 'description')
    {name: params[:name], price: params[:price], description: params[:description]}
  end
end


# around_action :clear_cache, only: :new
# def clear_cache
#   prepare_smth
#
#   yield
#
#   clear_cache
# end