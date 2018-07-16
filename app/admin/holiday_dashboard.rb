ActiveAdmin.register_page "HolidayDashboard" do

  menu priority: 1, label: 'Holiday Dashboard', parent: 'Dashboard'

  content title: 'Holiday Dashboard' do
      table do
        tbody do
          thead do
            th do
              td 'User'
              td 'Begin date'
              td 'End date'
            end
          end
          Holiday.all.each do |holiday|
            tr do
              td
              td link_to holiday.user.name, admin_user_path(holiday.user)
              td I18n.l(holiday.begin_date)
              td I18n.l(holiday.end_date)
            end
          end
        end
      end
    end
end
