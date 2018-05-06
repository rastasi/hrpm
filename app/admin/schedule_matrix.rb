def date_interval
  (Date.today-6.months..Date.today+6.months).to_a.select { |day| day.wday == 2 }
end

ActiveAdmin.register_page "ReservationMatrix" do

  menu priority: 1, label: 'Reservation Matrix', parent: 'Dashboard'

  content title: 'Reservation Matrix' do
    table do
      thead do
        tr do
          td
          td do
            'Name'
          end
          date_interval.each do |date|
            td class: 'date_interval' do
              [date.year, date.strftime("%B"), date.cweek].join('</br>').html_safe
            end
          end
        end
      end
      tbody do
        User.applicable.each do |user|
          tr do
            td
            td do
              user.name
            end
            date_interval.each_with_index do |date, index|
              td do
                user.projects_by_date(date, date_interval[index+1]).join(',')
              end
            end
          end
        end
      end
    end
  end
end