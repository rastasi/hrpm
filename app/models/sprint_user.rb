class SprintUser < ApplicationRecord
  belongs_to :sprint
  belongs_to :user

  after_create :create_for_all_sprints

  def create_for_all_sprints
    return unless self.for_all_sprints
    self.sprint.project.sprints.each do |sprint|
      sprint.sprint_users.create(user: self.user, percent: self.percent) if self.sprint.id != sprint.id
    end
  end
end
