ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  action_item :admin_user_user_skills, only: %i[show edit] do
    link_to 'Skills', admin_user_user_skills_path(resource)
  end

  index do
    selectable_column
    id_column
    column :name    
    column :email
    column :team
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
