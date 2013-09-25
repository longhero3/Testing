class AddProductPriceToLineItem < ActiveRecord::Migration
  def change
    add_column :line_items, :product_price, :decimal, default: 0.0
  end
end
