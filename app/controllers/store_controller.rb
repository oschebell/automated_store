class StoreController < ApplicationController
  def home
    @title = "Automated Store"
    @product = Product.newest
    @classic = Product.oldest
    @categories = Category.all

  end

  def about
    @title = "About the Store"
  end

  def contact
  end
end
