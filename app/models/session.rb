class Session < ApplicationRecord

  #has_one :room

  has_many :attendances
  has_many :students, through: :attendances 

  belongs_to :formation
  belongs_to :creator, class_name: 'Admin'

  def self.get_my_sessions(params)
  
    answer = ''
    if is_teacher?
      answer = Session.joins(:formation).where("teacher_id = ?", params.id)
    elsif is_student?
      answer = Session.joins(:students).where("student_id = ?", params.id)
    else
      answer = "dw"
    end

  return answer
  end
end
