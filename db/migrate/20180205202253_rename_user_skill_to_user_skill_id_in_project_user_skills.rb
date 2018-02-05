class RenameUserSkillToUserSkillIdInProjectUserSkills < ActiveRecord::Migration[5.1]
  def change
    rename_column :project_user_skills, :user_skill, :user_skill_id
  end
end
