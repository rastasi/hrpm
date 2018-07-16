ActiveAdmin.register_page "Statistics" do

  menu priority: 6, label: 'Statistics', parent: 'Misc'

  content title: 'Statistics' do
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
  end
end
