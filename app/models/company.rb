class Company < ApplicationRecord
  has_many :students
  belongs_to :creator, class_name: 'Admin'
end
