class ChangeStatusKeyToOrder < ActiveRecord::Migration[5.2]
  def change
  	rename_column :orders , :status ,:order_status
  end
end
