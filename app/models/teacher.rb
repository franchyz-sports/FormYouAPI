class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable,
         jwt_revocation_strategy: JwtBlacklist

  has_many :formations

  def self.get_data(teacher_id, user_id, user_type)
    if (user_type == 'teacher' && user_id == 'teacher_id' || user_type == 'admin')
      return Teacher.find(student_id)
    else
      render json: 'Access Unauthorized'
    end
  end
end
