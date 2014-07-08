class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :team_membership
  has_one :team, through: :team_membership

  has_many :activity_logs
  has_many :activity_records, through: :activity_logs

  validates :namefirst, :namelast, presence: :true

  def score
  	self.activity_records.collect {|x| x.activity.points}.reduce(:+) || 0
  end


end
