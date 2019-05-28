class CreateSprints < ActiveRecord::Migration[5.1]
  def change
    create_table :sprints do |t|
      t.date :begin_date
      t.date :end_date
      t.integer :project_id
      t.text :required_content
      t.string :status
      t.timestamps
    end
  end
end
