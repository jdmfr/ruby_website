class CreateCollectLines < ActiveRecord::Migration[5.2]
  def change
    create_table :collect_lines do |t|

      t.timestamps
    end
  end
end
