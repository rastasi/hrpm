class AddForAllSprintsToSprintUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :sprint_users, :for_all_sprints, :boolean, default: false
  end
end
