class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity

  belongs_to :order
  belongs_to :cart
  belongs_to :product

  def total_price
  	product.price * quantity
  end

  def price
  	product.price 
  end

  def delete_one(id)
  	 product.price += 123.0
  end

end
