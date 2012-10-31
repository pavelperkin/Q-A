class User < ActiveRecord::Base
  has_many :quests
  has_many :answers
  has_many :comments
  has_many :authentications
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nickname
  # attr_accessible :title, :body
  
  validates :email, :presence => true,
					 :format => {:with => /([-a-z0-9_.+]+@[-a-z0-9.]+\.[-a-z0-9]{2,8})$/} 
	
  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end
  
  def password_required?
    (authentications.empty? || !password.blank?) && super
    end
end
