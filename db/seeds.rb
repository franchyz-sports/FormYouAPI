# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
require 'faker'

Attendance.destroy_all
Session.destroy_all
Formation.destroy_all
Admin.destroy_all
Teacher.destroy_all
Student.destroy_all

password = 'qwerty'
puts "Desctruction of BDD done"

5.times do
  Admin.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: password, birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: Faker::Gender.short_binary_type, address: Faker::Address.street_address, city: Faker::Address.city, zip_code: Faker::Address.zip_code)
end

puts "Admins has been created"

10.times do
  Teacher.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: password, birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: Faker::Gender.short_binary_type, address: Faker::Address.street_address, city: Faker::Address.city,zip_code: Faker::Address.zip_code, expertise: Faker::Educator.subject)
end

puts "Teachers has been created"

30.times do
  Student.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: password, birthdate: Faker::Date.birthday(min_age: 18, max_age: 65), gender: Faker::Gender.short_binary_type, address: Faker::Address.street_address, city: Faker::Address.city,zip_code: Faker::Address.zip_code, study_level: Faker::Educator.degree)
end
 
puts "Students has been created"

8.times do 
  Formation.create(title: Faker::Educator.course_name, description: Faker::Lorem.sentence(word_count: 6), creator: Admin.all.sample, teacher: Teacher.all.sample)
end

puts "Formations has been created"

30.times do
  Session.create(max_student: rand(12..20), date: Faker::Date.between(from: 1.month.ago, to: 5.month.from_now), creator: Admin.all.sample, formation: Formation.all.sample)
end

70.times do 
  session = Session.all.sample
  if session.date < Date.today 
    Attendance.create(note: rand(0..20), presence: (1 == rand(2)), student: Student.all.sample, session: session)
  else
    Attendance.create(student: Student.all.sample, session: session)
  end
end


