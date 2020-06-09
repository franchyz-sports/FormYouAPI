class Session < ApplicationRecord

  #has_one :room

  has_many :attendances
  has_many :students, through: :attendances 

  belongs_to :formation
  belongs_to :creator, class_name: 'Admin'

end
