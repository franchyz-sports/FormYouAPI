class Session < ApplicationRecord

  include UsersHelper
  #has_one :room

  has_many :attendances
  has_many :students, through: :attendances

  belongs_to :formation
  belongs_to :creator, class_name: 'Admin'
  belongs_to :room

=begin
  def self.get_personal_sessions
    if teacher_signed_in?
      return Session.joins(formation: :teacher).where("teacher_id = ?", current_teacher.id)
    elsif admin_signed_in?
      return Session.joins(formation: :creator).where("creator_id = ?", current_admin.id)
    elsif student_signed_in?
      return Session.joins(:students).distinct.where("student_id = ?", current_student.id)
    end
  end
=end

  def self.get_my_sessions(id)
  
    if true
      answer = Session.joins(:formation).where("teacher_id = ?", id)
    elsif true
      answer = Session.joins(:students).where("student_id = ?", id)
    else
      answer = "dw"
    end

    Formation.joins(:sessions, :students).where("student_id = ?", id)

  return answer
  end
end
