class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.date :begin_date
      t.date :end_date
      t.integer :project_group_id

      t.timestamps
    end
  end
end
