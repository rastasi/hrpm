class Sprint < ApplicationRecord
  belongs_to :project
  has_many :sprint_users, dependent: :destroy
  before_save :update_full_time_interval

  def update_full_time_interval
    return unless self.full_time_interval
    self.begin_date = self.project.begin_date
    self.end_date = self.project.end_date
  end

  def name
    "#{self.project.name} - Sprint ##{self.id}" 
  end
end
