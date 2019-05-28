ActiveAdmin.register Project do
  PRIORITY_COLLECTION = ['Low', 'Medium', 'Hight']

  menu priority: 3
  permit_params(
    :name,
    :description, 
    :begin_date_date, 
    :begin_date_time_hour, 
    :begin_date_time_minute,
    :end_date_date, 
    :end_date_time_hour, 
    :end_date_time_minute, 
    :project_group_id, 
    :active, 
    :project_manager_id, 
    :pm_url, 
    :project_status_id,
    :original_estimation_time,
    :current_estimation_time,
    :time_spent,
    :priority
  )

  action_item :sprints, only: %i[show edit] do
    link_to 'Sprints', admin_project_sprints_path(resource)
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :pm_url
      f.input :begin_date, as: :just_datetime_picker
      f.input :end_date, as: :just_datetime_picker
      f.input :project_group
      f.input :project_manager
      f.input :project_status
      f.input :active
      f.input :original_estimation_time
      f.input :current_estimation_time
      f.input :time_spent
      f.input :priority, as: :select, collection: PRIORITY_COLLECTION
    end
    f.actions
  end

  show do
    h3 project.name
    panel "Details" do
      attributes_table_for project do
        row :name
        row :description
        row :pm_url
        row :project_status
        row :begin_date do
          l(project.begin_date)
        end
        row :end_date do
          l(project.end_date)
        end
        row :project_group
        row :project_manager
        row :original_estimation_time
        row :current_estimation_time
        row :time_spent
        row :priority
      end
    end
  end

  index do
    selectable_column
    column :name
    column :begin_date do |object|
      l(object.begin_date)
    end
    column :end_date do |object|
      l(object.end_date)
    end
    column :active
    column :project_manager
    column :project_group
    column :pm_url do |object|
      object.pm_url ? link_to('PM URL', object.pm_url) : '' 
    end
    column :priority
    actions do |project|
      link_to 'Sprints', admin_project_sprints_path(project.id), class: 'member_link'
    end
  end
end
