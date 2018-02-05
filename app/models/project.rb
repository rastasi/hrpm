class Project < ApplicationRecord
  include OnDay

  belongs_to :project_group
  has_many :project_users

  scope :active, -> { where(active: true) }
  scope :archived, -> { where(active: false) }  
end
