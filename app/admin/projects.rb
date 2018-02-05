ActiveAdmin.register Project do
  menu parent: 'Projects'
  permit_params :name, :description, :begin_date, :end_date, :project_group_id
end
