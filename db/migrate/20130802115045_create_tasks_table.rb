
class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :description
      t.symbol :status

      t.timestamps
    end
  end
end