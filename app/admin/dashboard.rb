ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel 'Projects count' do
          link_to Project.count, admin_projects_path
        end
      end

      column do
        panel 'Users count' do
          link_to User.count, admin_users_path
        end
      end

      column do
        panel 'Skills count' do
          link_to Skill.count, admin_skills_path
        end
      end
    end

    columns do
      column do
        panel 'Reservated users' do
          table do
            ProjectUserReservation.current.each do |project_user_reservation|
              tr do
                td link_to project_user_reservation.project_user.project.name, admin_project_path(project_user_reservation.project_user.project)
                td link_to project_user_reservation.project_user.user.name, admin_user_path(project_user_reservation.project_user.user)
                td project_user_reservation.begin_date ? l(project_user_reservation.begin_date, format: '%Y-%m-%d') : ''
                td project_user_reservation.end_date ? l(project_user_reservation.end_date, format: '%Y-%m-%d') : ''
              end
            end  
          end            
        end
      end

      column do
        panel 'Free users' do
          table do
            User.applicable.free_today.each do |user|
              tr do
                td link_to user.name, admin_user_path(user)
              end
            end  
          end            
        end
      end
    end

    panel 'Active projects' do
      table do
        Project.active.each do |project|
          tr do
            td link_to project.name, admin_project_path(project)
            td project.begin_date ? l(project.begin_date) : ''
            td project.end_date ? l(project.end_date) : ''                   
          end
        end  
      end            
    end
    
  end # content
end
