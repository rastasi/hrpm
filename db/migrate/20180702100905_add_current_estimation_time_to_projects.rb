class AddCurrentEstimationTimeToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :current_estimation_time, :integer
  end
end
