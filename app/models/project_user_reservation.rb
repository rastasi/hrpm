class ProjectUserReservation < ApplicationRecord
  belongs_to :project_user

  scope :current, -> { where("begin_date <= ? and end_date >= ?", Date.today, Date.today) }
end
