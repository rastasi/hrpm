class AddFullTimeIntervalToProjectUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :project_users, :full_time_interval, :boolean, default: false
  end
end
