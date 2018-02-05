ActiveAdmin.register ProjectUserSkill do
  menu parent: 'Projects'
  permit_params :project_user_id, :user_skill_id
end
