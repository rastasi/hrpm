class CreateProjectUserSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :project_user_skills do |t|
      t.integer :project_user
      t.integer :user_skill

      t.timestamps
    end
  end
end
