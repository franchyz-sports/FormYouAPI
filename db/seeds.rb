# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require 'facker'

Admin.destroy_all
Teacher.destroy_all
Student.destroy_all

puts "Desctruction of BDD done"
password = 'qwerty'

5.times do
  Admin.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: password, birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: Faker::Gender.short_binary_type, address: Faker::Address.street_address, city: Faker::Address.city,zip_code: Faker::Address.zip_code)
end
