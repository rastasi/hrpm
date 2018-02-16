class ProjectUserReservation < ApplicationRecord
  include OnDay
  belongs_to :project_user

  scope :current, -> { on_day(Date.today) }

  validates :project_user, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true
end
