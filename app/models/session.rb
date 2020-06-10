class Session < ApplicationRecord

  include UsersHelper
  #has_one :room

  has_many :attendances
  has_many :students, through: :attendances 

  belongs_to :formation
  belongs_to :creator, class_name: 'Admin'

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
