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
  #validates :begin_date, presence: true
  #validates :end_date, presence: true    
  after_save :update_full_time_interval

  def expired?
    return false unless self.end_date
    self.end_date < Date.today
  end
end
