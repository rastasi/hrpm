class User < ApplicationRecord
  include OnDay

  default_scope { order(last_name: :asc) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :project_users, dependent: :destroy
  has_many :user_skills, dependent: :destroy
  has_many :holidays, dependent: :destroy
  belongs_to :team

  scope :applicable, -> { where(applicable: true) }
  scope :not_applicable, -> { where(applicable: false) }  

  def name
    [self.first_name, self.last_name].join(' ')
  end

  def self.free_on_date(date)
    reservated_user_ids = ProjectUserReservation.on_day(date).map do |project_user_reservation|
      project_user_reservation.project_user.user.try :id
    end
    holiday_user_ids = Holiday.on_day(date).map do |holiday| 
      holiday.user.id
    end
    User.where.not(id: (reservated_user_ids+holiday_user_ids).uniq)
  end

  def self.free_today
    free_on_date(Date.today)
  end

  def free_until
    ProjectUserReservation
      .joins(:project_user)
      .where('project_users.user_id = ? and project_user_reservations.begin_date > ?', self.id, Date.today)
      .first.try :end_date
  end

  def projects_by_date(begin_date, end_date)
    ProjectUserReservation
     .joins(:project_user => :user)
     .where('users.id = ? and ((begin_date <= ? and end_date >= ?) or (begin_date > ? and end_date < ?))', self.id, begin_date, end_date, begin_date, end_date)
     .map { |project_user_reservation| project_user_reservation.project_user.project.try :name }
  end
end
