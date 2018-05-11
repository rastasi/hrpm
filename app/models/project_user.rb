class ProjectUser < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :project_user_reservations, dependent: :destroy
  has_many :project_user_skills, dependent: :destroy

  validates :user, presence: true, uniqueness: { scope: :project }
  validates :project, presence: true
  after_save :update_full_time_interval
  
  def name
    [self.project.try(:name), self.user.try(:name)].join(' - ')
  end

  def update_full_time_interval
    if self.full_time_interval
      remove_reservations
      create_full_time_interval_reservation if project_have_dates?
    end
  end

  private
  
  def remove_reservations
    self.project_user_reservations.destroy_all if self.project_user_reservations.any?
  end

  def create_full_time_interval_reservation
    self.project_user_reservations.create(begin_date: self.project.begin_date, end_date: self.project.end_date)
  end

  def project_have_dates?
    self.project.begin_date || self.project.end_date
  end
end
