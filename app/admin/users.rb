ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  action_item :admin_user_user_skills, only: %i[show edit] do
    link_to 'Skills', admin_user_user_skills_path(resource)
  end

  show do
    h3 user.name
    panel "Details" do
      attributes_table_for user do
        row :email
        row :last_sign_in_at
        row :team
      end
    end
    panel "Skills" do
        table do
          th do
            td 'Name'
            td 'Level'
            td 'Group'
          end
          user.user_skills.each do |user_skill|
            tr do
              td
              td user_skill.skill.name
              td user_skill.level
              td user_skill.skill.skill_group.name
            end                
          end
        end
    end
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
