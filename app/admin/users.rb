ActiveAdmin.register User do
  menu priority: 4
  permit_params :email, :password, :password_confirmation, :first_name, :last_name, :team_id, :applicable

  action_item :admin_user_user_skills, only: %i[show edit] do
    link_to 'Skills', admin_user_user_skills_path(resource)
  end

  action_item :admin_user_holidays, only: %i[show edit] do
    link_to 'Holidays', admin_user_holidays_path(resource)
  end

  show do
    h3 user.name
    panel "Details" do
      attributes_table_for user do
        row :email
        row :last_sign_in_at
        row :team
        row :applicable
      end
    end

    if user.user_skills.any?
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

    if user.holidays.any?
      panel "Holidays" do
        table do
          th do
            td 'Begin date'
            td 'End date'
          end
          user.holidays.each do |holiday|
            tr do
              td
              td holiday.begin_date
              td holiday.end_date
            end                
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
    column :applicable
    actions do |user|
      link_to('Skills', admin_user_user_skills_path(user), class: 'member_link')+
      link_to('Holidays', admin_user_holidays_path(user), class: 'member_link')
    end
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password, required: false
      f.input :password_confirmation, required: false
      f.input :team
      f.input :applicable
    end
    f.actions
  end


  controller do
    before_action :remove_passowrd_if_empty, only: :update
    def remove_passowrd_if_empty
      %w(password password_confirmation).each { |param| params[:user].delete(param) } if params[:user] && params[:user][:password].blank?
    end
  end

end
