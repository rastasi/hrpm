class AddFullTimeIntervalToSteps < ActiveRecord::Migration[5.1]
  def change
    add_column :sprints, :full_time_interval, :boolean, default: false
  end
end
