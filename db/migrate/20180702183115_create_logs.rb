class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.string :entity_type
      t.string :entity_id
      t.text :change
      t.timestamps
    end
  end
end
