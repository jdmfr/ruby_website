class AddReferenceToUsersAndProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :collect_lines,:user,  foreign_key: true
    add_reference :collect_lines,:product,  foreign_key: true
  end
end
