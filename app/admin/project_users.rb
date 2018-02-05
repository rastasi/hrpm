ActiveAdmin.register ProjectUser do
  menu parent: 'Projects'
  permit_params :project_id, :user_id
end
