ActiveAdmin.register Project do
  menu priority: 3
  permit_params :name, :description, :begin_date_date, :begin_date_time_hour, :begin_date_time_minute, :end_date_date, :end_date_time_hour, :end_date_time_minute, :project_group_id, :active

  action_item :project_users, only: %i[show edit] do
    link_to 'Project Users', admin_project_project_users_path(resource)
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :begin_date, as: :just_datetime_picker
      f.input :end_date, as: :just_datetime_picker
      f.input :project_group
      f.input :active
    end
    f.actions
  end

  show do
    h3 project.name
    panel "Details" do
      attributes_table_for project do
        row :name
        row :description
        row :begin_date
        row :end_date
        row :project_group
      end
    end
    if project.project_users.any?
      panel "Users" do
        project.project_users.each do |project_user|
          h4 link_to project_user.user.name, admin_user_path(project_user.user)
          if project_user.project_user_skills.any?
            h5 'Skills'
            table do
              thead do
                th do
                  td 'Name'
                  td 'Level'
                  td 'Group'
                end
              end
              project_user.project_user_skills.each do |project_user_skill|
                tr do
                  td
                  td project_user_skill.user_skill.skill.name
                  td project_user_skill.user_skill.level
                  td project_user_skill.user_skill.skill.skill_group.name              
                end                
              end
            end
          end
          if project_user.project_user_reservations.any?
            h5 'Reservations'
            table do
              thead do
                th do
                  td 'Begin date'
                  td 'End date'
                end
              end
              tbody do
                project_user.project_user_reservations.each do |project_user_reservation|
                  tr do
                    td
                    td project_user_reservation.begin_date
                    td project_user_reservation.end_date
                  end
                end
              end
            end
          end
        end
      end
    end
  end

  index do
    selectable_column
    column :name
    column :begin_date
    column :end_date
    column :active
    column :project_group
    actions do |project|
      link_to 'Users', admin_project_project_users_path(project.id), class: 'member_link'
    end
  end
end
