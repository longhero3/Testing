class CopyProductPriceFromProduct < ActiveRecord::Migration
  def up
  	LineItem.find(:all).each do |line_item|
  		line_item.update_attribute :product_price, 0.0
 	end 
  end

  def down
  	LineItem.find(:all).each do |line_item|
  		line_item.product_price = 0.0
 	end 
  end
end
