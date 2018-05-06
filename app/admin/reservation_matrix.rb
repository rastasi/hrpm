def date_interval
  (Date.today-6.months..Date.today+6.months).to_a.select { |day| day.wday == 2 }
end

def current_week?(date)
  date.year == Date.today.year && date.cweek == Date.today.cweek
end

def td_classes(date, index)
  klasses = []
  klasses.push 'current' if current_week?(date)
  klasses.push(index % 2 == 0 ? 'odd' : 'even')
  klasses.join(' ')
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
          date_interval.each_with_index do |date, index|
            td class: td_classes(date, index) do
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
              td class: td_classes(date, index) do
                user.projects_by_date(date, date_interval[index+1]).join(',')
              end
            end
          end
        end
      end
    end
  end
end