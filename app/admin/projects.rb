ActiveAdmin.register Project do
  menu parent: 'Projects'
  permit_params :name, :description, :begin_date, :end_date, :project_group_id

  action_item :project_users, only: %i[show edit] do
    link_to 'Users', admin_project_project_users_path(resource)
  end
end
