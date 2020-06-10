class Room < ApplicationRecord
  has_many :sessions
  belongs_to :creator, class_name: 'Admin', inverse_of: :rooms
end
