ActiveAdmin.register Sprint do
  belongs_to :project
  permit_params :begin_date, :end_date, :full_time_interval, :required_content, :status
  actions :new, :create, :edit, :update, :destroy, :index  
  config.filters = false
  
  index do
    selectable_column
    column :begin_date
    column :end_date
    column :status
    column :full_time_interval
    actions do |sprint|
      link_to 'Sprint users', admin_sprint_sprint_users_path(sprint.id), class: 'member_link'
    end
  end

  form do |f|
    f.inputs do
      f.input :project_id, as: :select, collection: Project.active
      f.input :status, as: :select, collection: ['Success', 'Failed']
      f.input :begin_date
      f.input :end_date
      f.input :full_time_interval
      f.input :required_content
    end
    f.actions
  end

end
