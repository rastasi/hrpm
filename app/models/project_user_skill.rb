class ProjectUserSkill < ApplicationRecord
  belongs_to :project_user
  belongs_to :user_skill
end
