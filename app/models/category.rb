class Category < ApplicationRecord
  has_and_belongs_to_many :formations
  belongs_to :creator, class_name: 'Admin'
end
