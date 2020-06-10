class Formation < ApplicationRecord
  belongs_to :teacher
  belongs_to :creator, class_name: 'Admin'
  has_many :sessions
  has_and_belongs_to_many :categories

  def self.get_personal_formations
    if teacher_signed_in?
      return Formation.where('teacher_id' => current_teacher.id)
    elsif admin_signed_in?
      return Formation.where('admin_id' => current_admin.id)
    elsif student_signed_in?
      return Formation.joins(sessions: :students).where("student_id = ?", current_student.id)

    end
  end
end
