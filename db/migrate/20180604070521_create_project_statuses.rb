class CreateProjectStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :project_statuses do |t|
      t.string :name
      t.string :color
    end
  end
end
