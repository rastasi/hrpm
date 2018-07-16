ActiveAdmin.register_page "UserReservations" do

  menu priority: 1, label: 'Reservations'

  content title: 'Reservations' do
    columns do
      column do
        panel 'Reservated users' do
          table do
            thead do
              th do
                td 'Name'
                td 'Begin date'
                td 'End date'              
                td 'Project'
              end
            end
            tbody do
              ProjectUserReservation.current.each do |project_user_reservation|
                tr do
                  td
                  td link_to project_user_reservation.project_user.user.name, admin_user_path(project_user_reservation.project_user.user)
                  td l(project_user_reservation.begin_date)
                  td l(project_user_reservation.end_date)
                  td link_to project_user_reservation.project_user.project.name, admin_project_path(project_user_reservation.project_user.project)
                end
              end
            end
          end            
        end
      end

      column do
        panel 'Free users' do
          table do
            thead do
              th do
                td 'Name'
                td 'Free until'
              end
            end
            tbody do
              User.applicable.free_today.each do |user|
                tr do
                  td
                  td link_to user.name, admin_user_path(user)
                  td l(user.free_until)
                end
              end  
            end
          end
        end
      end
    end
    
  end # content
end
