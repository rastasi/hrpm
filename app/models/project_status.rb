class ProjectStatus < ApplicationRecord
  has_many :projects
  validates :name, uniqueness: true, presence: true
end
