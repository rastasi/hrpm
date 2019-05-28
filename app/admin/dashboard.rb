ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: 'Active projects'

  content title: 'Active projects' do
    columns do
      column do
        table do
          thead do
            th do
              td 'Name'
              td 'Begin date'
              td 'End date'
              td 'Project manager'
              td 'Members'
              td 'PM URL'
              td 'Status'
            end
          end
          tbody do
            Project.active.order(:end_date => :asc).each do |project|
              tr do
                td
                td link_to project.name, admin_project_path(project)
                td l(project.begin_date)
                td l(project.end_date), style: (project.expired? ? 'color: red' : '')
                td project.project_manager.try :name
                td do
                  members = ['<ul>']
                  project.sprints.each do |sprint|
                    members.push "<li style='list-style-type: square;'><strong>#{sprint.name}</strong><ul>"
                    members.push sprint.sprint_users.select { |sprint_user| sprint_user.user.applicable }.map { |sprint_user| "<li style='list-style-type: circle; margin-left: 10px'>#{sprint_user.user.try(:name)}</li>" }.join('')
                    members.push '</ul></li>'
                  end
                  members.push '</ul>'
                  members.join('').html_safe
                end
                td project.pm_url ? link_to('PM URL', project.pm_url) : ''
                td project.project_status.try :name
              end
            end
          end
        end
      end
    end
  end # content
end
