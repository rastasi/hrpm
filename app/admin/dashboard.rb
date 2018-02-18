ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel 'Projects count' do
          Project.count
        end
      end

      column do
        panel 'Users count' do
          User.count
        end
      end

      column do
        panel 'Skills count' do
          Skill.count
        end
      end
    end

    columns do
      column do
        panel 'Reservated users' do
          table do
            ProjectUserReservation.current.each do |project_user_reservation|
              tr do
                td project_user_reservation.project_user.project.name
                td project_user_reservation.project_user.user.name
                td l(project_user_reservation.begin_date, format: '%Y-%m-%d')
                td l(project_user_reservation.end_date, format: '%Y-%m-%d')
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
                td user.name                                                
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
            td project.name
            td l project.begin_date
            td l project.end_date                                                
          end
        end  
      end            
    end
    
  end # content
end
