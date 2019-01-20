ActiveAdmin.register_page "UserSkillsDashboard" do

  menu priority: 1, label: 'Skill Summary', parent: 'Misc'

  content title: 'User Skills' do
      table do
        tbody do
          thead do
            th do
              td 'User'
              td 'Skills'
              td 'Opereations'
            end
          end
          User.all.each do |user|
            tr do
              td
              td user.name
              td user.user_skills.all.map { |us| "#{us.skill.name} (#{us.level})" }.join('<br />').html_safe
              td do
                link_to('Edit', admin_user_user_skills_path(user), class: 'member_link')
              end
            end
          end
        end
      end
    end
end
