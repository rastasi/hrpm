class RenameProjectUserToProjectUserIdInProjectUserSkills < ActiveRecord::Migration[5.1]
  def change
    rename_column :project_user_skills, :project_user, :project_user_id
  end
end
