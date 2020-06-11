class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist
  has_many :sessions
  has_many :categories
  has_many :rooms, inverse_of: :creator
  has_many :formations
  has_many :companies
  after_create :welcome_send

  def welcome_send
    AdminMailer.welcome_email(self).deliver_now
  end
  
end
