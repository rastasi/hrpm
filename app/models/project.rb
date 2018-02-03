class Project < ApplicationRecord
  belongs_to :project_group
  has_many :project_users
end
