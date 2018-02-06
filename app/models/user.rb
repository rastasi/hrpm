class User < ApplicationRecord
  include OnDay

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :project_users
  has_many :user_skills
  belongs_to :team

  def name
    [self.first_name, self.last_name].join(' ')
  end

  def self.free_on_date(date)
    reservated_ids = ProjectUserReservation.on_day(date).map do |project_user_reservation|
      project_user_reservation.project_user.user.id
    end
    User.where.not(id: reservated_ids)
  end

  def self.free_today
    free_on_date(Date.today)
  end
end
