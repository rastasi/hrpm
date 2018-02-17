class Project < ApplicationRecord
  include OnDay

  just_define_datetime_picker :begin_date
  just_define_datetime_picker :end_date
  
  belongs_to :project_group
  has_many :project_users

  scope :active, -> { where(active: true) }
  scope :archived, -> { where(active: false) }  

  validates :name, uniqueness: true, presence: true
  validates :project_group, presence: true
  #validates :begin_date, presence: true
  #validates :end_date, presence: true    
end
