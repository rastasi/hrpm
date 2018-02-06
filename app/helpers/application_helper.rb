module ApplicationHelper

  def reservations_to_date(date)
    ProjectUserReservation.on_day(date)
  end

  def projects_to_date(date)
    Project.on_day(date)
  end
end
