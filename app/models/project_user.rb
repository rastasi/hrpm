class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :project_user_reservations
  has_many :project_user_skills

  validates :user, presence: true, uniqueness: { scope: :project }
  validates :project, presence: true
  
  def name
    [self.project.try(:name), self.user.try(:name)].join(' - ')
  end
end
