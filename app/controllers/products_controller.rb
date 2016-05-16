class ProductsController < ApplicationController
  def show
    @product = Product.find(params[:id])
  end

  def index
    @title = "All Products"
    @products = Product.available
  end
end
