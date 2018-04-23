ActiveAdmin.register ProjectUser do
  permit_params :project_id, :user_id
  actions :new, :create, :edit, :update, :destroy, :index    
  belongs_to :project

  action_item :project_user_skills, only: %i[show edit] do
    link_to 'Skills', admin_project_user_project_user_skills_path(resource)
  end

  action_item :project_user_reservations, only: %i[show edit] do
    link_to 'Reservations', admin_project_user_project_user_reservations_path(resource)
  end

  index do
    selectable_column
    column :user
    column :job
    actions do |project_user|
      link_to('Skills', admin_project_user_project_user_skills_path(project_user.id), class: 'member_link') +
      link_to('Reservations', admin_project_user_project_user_reservations_path(project_user.id), class: 'member_link')
    end
  end
end
