module ApplicationHelper

  def reservations_to_date(date)
    ProjectUserReservation.on_day(date).map { |r| r.project_user.user.name }.join(', ')
  end

  def projects_to_date(date)
    Project.on_day(date).map {|p| p.name }.join(', ')
  end
end
