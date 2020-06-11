json.session @session
json.students @session.students.each do |student|
  json.id student.id
  json.first_name student.first_name
  json.last_name student.last_name
  json.birthdate student.birthdate
  json.gender student.gender
  json.address student.address
  json.city student.city
  json.zip_code student.zip_code
  json.expertise student.expertise
end

json.formation @session.formation do |formation|
  json.id formation.id
  json.title formation.title
  json.description formation.description
end

json.categories @session.formation.categories.each do |category|
  json.category category.title
  json.creator category.creator
end

json.teacher @session.formation.teacher do |teacher|
  json.id teacher.id
  json.first_name teacher.first_name
  json.last_name teacher.last_name
  json.birthdate teacher.birthdate
  json.gender teacher.gender
  json.address teacher.address
  json.city teacher.city
  json.zip_code teacher.zip_code
  json.expertise teacher.expertise
end

json.room @session.room do |room|
  json.id room.id
  json.name room.name
  json.creator room.creator
end
