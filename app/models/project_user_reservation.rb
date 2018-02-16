class ProjectUserReservation < ApplicationRecord
  include OnDay
  
  just_define_datetime_picker :begin_date
  just_define_datetime_picker :end_date
  
  belongs_to :project_user

  scope :current, -> { on_day(Date.today) }

  validates :project_user, presence: true
  validates :begin_date, presence: true
  validates :end_date, presence: true
end
