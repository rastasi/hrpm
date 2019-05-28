class User < ApplicationRecord
  include OnDay

  default_scope { order(last_name: :asc) }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  has_many :sprint_users, dependent: :destroy
  has_many :user_skills, dependent: :destroy
  has_many :holidays, dependent: :destroy
  has_many :managed_projects, class_name: 'Project', foreign_key: :project_manager_id
  belongs_to :team

  scope :applicable, -> { where(applicable: true) }
  scope :not_applicable, -> { where(applicable: false) }

  def name
    [self.first_name, self.last_name].join(' ')
  end

  def self.free_today
    free_on_date(Date.today)
  end
end
