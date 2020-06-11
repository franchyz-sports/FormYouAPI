class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  has_many :formations
  after_create :welcome_send

  def welcome_send
    TeacherMailer.welcome_email(self).deliver_now
  end
end
