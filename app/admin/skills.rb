ActiveAdmin.register Skill do
  menu parent: 'Skills'
  permit_params :name, :skill_group_id
end
