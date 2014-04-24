class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :activity_records

  validates :namefirst, :namelast, presence: :true

  def score
  	self.activity_records.collect {|x| x.activity.points}.reduce(:+)
  end


end
