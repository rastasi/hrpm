class AddOriginalEstimationTimeToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :original_estimation_time, :integer
  end
end
