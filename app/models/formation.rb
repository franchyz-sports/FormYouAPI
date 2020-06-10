class Formation < ApplicationRecord
  belongs_to :teacher
  belongs_to :creator, class_name: 'Admin'
  has_many :sessions
  has_and_belongs_to_many :categories

  def self.get_personal_formations(id, type)
    if (type == 'teacher')
      return Formation.where('teacher_id' => id)
    elsif (type == 'student')
      return Formation.joins(sessions: :students).where("student_id = ?", id)
    else
      return 'error'
    end

  end
end
