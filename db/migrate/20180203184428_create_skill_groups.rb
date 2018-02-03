class CreateSkillGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :skill_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
