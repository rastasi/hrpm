class ProjectUserSkill < ApplicationRecord
  belongs_to :project_user
  belongs_to :user_skill

  validates :user_skill, presence: true, uniqueness: { scope: :project_user }  
  validates :project_user, presence: true
  
end
