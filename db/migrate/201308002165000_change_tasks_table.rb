
class ChangeTasksTable < ActiveRecord::Migration
  def change
    change_table :tasks do |t|
      t.belongs_to :list
      t.column :completed_at, :datetime
    end
  end
end
