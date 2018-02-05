ActiveAdmin.register UserSkill do
  menu parent: 'People'
  permit_params :skill_id, :user_id, :level
end
