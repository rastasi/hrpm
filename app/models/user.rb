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
end
