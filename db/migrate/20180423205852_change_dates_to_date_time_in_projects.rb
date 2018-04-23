class ChangeDatesToDateTimeInProjects < ActiveRecord::Migration[5.1]
  def change
    change_column :projects, :begin_date, :datetime
    change_column :projects, :end_date, :datetime
  end
end
