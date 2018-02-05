class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :project_user_reservations
  has_many :project_user_skills

  def name
    [self.project.name, self.user.name].join(' - ')
  end
end
