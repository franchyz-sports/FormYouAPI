class Session < ApplicationRecord

  #has_one :room

  has_many :attendances
  has_many :students, through: :attendances 

  belongs_to :formation
  belongs_to :creator, class_name: 'Admin'

  self.get_my_sessions(params)
  
    if is_teacher?
      answer = Session.joins(:formation).where("teacher_id = ?", params.id)
    else if is_student?
      answer = Session.joins(:formation).where(student_id: params.id)
    else
      answer = "dw"
    end

    answer
  end
end
