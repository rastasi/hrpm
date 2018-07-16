class AddTimeSpentToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :time_spent, :integer
  end
end
