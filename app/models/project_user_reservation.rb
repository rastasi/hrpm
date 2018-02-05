class ProjectUserReservation < ApplicationRecord
  include OnDay
  
  belongs_to :project_user

  scope :current, -> { on_day(Date.today) }
end
