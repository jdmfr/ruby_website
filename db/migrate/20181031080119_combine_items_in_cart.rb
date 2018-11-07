class CombineItemsInCart < ActiveRecord::Migration[5.2]
  def up
  	Cart.all.each do |cart|
  		sums= cart.line_items.group(:product_id).sum(:quantity)
  		sum.each do |product_id, quantity|
  			if quantity>1
  				cart.line_items.where(product_id: product_id).delete_all
  				item=cart.line_items.bulid(product_id: product_id)
  				item.quantity =quantity
  				item.save!
  			end
  		end
  	end
  end
end