class CreateSprintUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :sprint_users do |t|
      t.integer :sprint_id
      t.integer :user_id
      t.integer :percent
    end
  end
end
