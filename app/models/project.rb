require 'date'
DEFAULT_SPRINT_LENGTH = 14

class Project < ApplicationRecord
  include OnDay

  just_define_datetime_picker :begin_date
  just_define_datetime_picker :end_date
  
  belongs_to :project_group
  belongs_to :project_status
  belongs_to :project_manager, class_name: 'User'
  has_many :sprints

  scope :active, -> { where(active: true) }
  scope :archived, -> { where(active: false) }  

  validates :name, uniqueness: true, presence: true
  validates :project_group, presence: true
  # validates :begin_date, presence: true
  # validates :end_date, presence: true    
  after_save :update_full_time_interval
  after_create :create_sprints

  def expired?
    return false unless self.end_date
    self.end_date < Date.today
  end

  def update_full_time_interval
    self.sprints.each do |sprint|
      if sprint.full_time_interval
        sprint.update_attributes(begin_date: self.begin_date, end_date: self.end_date)
      end
    end
  end

  def create_sprints
    next_monday = self.begin_date + (8 - self.begin_date.wday).days
    sprint_begin_date = self.begin_date
    sprint_end_date = next_monday + DEFAULT_SPRINT_LENGTH.days - 1.days
    self.sprints.create(begin_date: sprint_begin_date, end_date: sprint_end_date)
    
    while (sprint_end_date + DEFAULT_SPRINT_LENGTH.days - 1.days <= self.end_date)
      sprint_begin_date = sprint_end_date + 1.days
      sprint_end_date = sprint_begin_date + DEFAULT_SPRINT_LENGTH.days - 1.days
      self.sprints.create(begin_date: sprint_begin_date, end_date: sprint_end_date)
    end

    if sprint_end_date < self.end_date
      sprint_begin_date = sprint_end_date + 1.days
      sprint_end_date = self.end_date
      self.sprints.create(begin_date: sprint_begin_date, end_date: sprint_end_date)
    end
  end

end
