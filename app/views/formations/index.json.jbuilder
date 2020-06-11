
json.array! @formations do |formation|
  json.formation do
    json.id formation.id
    json.title formation.title
    json.description formation.description
  end

  json.teacher formation.teacher do |teacher|
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

  json.categories formation.categories.each do |category|
    json.category category.title
  end
end
