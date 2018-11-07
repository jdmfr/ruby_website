class AddStatusToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders,:status,:integer,default: 0
  	add_reference :orders,:user,foreign_key: true
  end
end
