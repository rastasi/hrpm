class Sprint < ApplicationRecord
  belongs_to :project
  has_many :sprint_users, dependent: :destroy

  def name
    "#{self.project.name} - Sprint ##{self.id}" 
  end
end
