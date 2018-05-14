ActiveAdmin.register_page "ActiveProjects" do

  menu priority: 1, label: 'Active Projects', parent: 'Dashboard'

  content title: 'Active Projects' do
    Project.active.each do |project|
      panel "#{project.name} (#{l(project.begin_date)} - #{l(project.end_date)}) (PM: #{project.project_manager.try :name})" do
        table do
          tbody do
            project.project_users.each do |project_user|
              tr do
                td
                td do
                  h3 link_to project_user.user.name, admin_user_path(project_user.user)
                  if project_user.project_user_reservations.present?
                    h4 'Reservations'
                    table do
                      thead do
                        th do
                          td 'Begin date'
                          td 'End date'
                        end
                      end
                      tbody do
                        project_user.project_user_reservations.each do |reservation|
                          td
                          td l(reservation.begin_date)
                          td l(reservation.end_date)
                        end
                      end
                    end
                  end

                  if project_user.project_user_skills.present?
                    h4 'Skills'
                    table do
                      thead do
                        th do
                          td 'Name'
                          td 'Group'
                          td 'Level'
                        end
                      end
                      tbody do
                        project_user.project_user_skills.each do |project_user_skill|
                          td
                          td project_user_skill.user_skill.skill.name
                          td project_user_skill.user_skill.skill.skill_group.name
                          td project_user_skill.user_skill.level
                        end
                      end
                    end
                  end

                end
              end
            end
          end
        end
      end
    end
  end # content
end
