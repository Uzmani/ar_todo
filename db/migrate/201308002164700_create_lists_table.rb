
class CreateListsTable < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :active_list

      t.timestamps
    end
  end
end
