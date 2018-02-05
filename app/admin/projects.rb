ActiveAdmin.register Project do
  permit_params :name, :description, :begin_date, :end_date, :project_group_id, :active

  action_item :project_users, only: %i[show edit] do
    link_to 'Users', admin_project_project_users_path(resource)
  end

  index do
    selectable_column
    column :name
    column :begin_date
    column :end_date
    column :active
    actions
  end
end
