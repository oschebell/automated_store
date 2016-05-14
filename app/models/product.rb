class Product < ActiveRecord::Base
  validates :name, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}

  belongs_to :category

  def purchase
    if self.quantity > 0
      self.update_attributes({:quantity => self.quantity-1})
      # or
      # if quantity > 0
      # decrement(:quantity)
      return true
    end
  end

  def self.available
    Product.where.not(:quantity => 0)
  end

  def self.newest
    Product.order(:created_at).last
  end

  def self.oldest
    Product.order(:created_at).first
  end

  def sold_out
    Product.where(:quantity => 0)
  end

end
