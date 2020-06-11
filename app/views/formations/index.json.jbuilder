
json.array! @formations do |formation|
  json.formation do
    json.title formation.title
    json.description formation.description
    json.teacher do
      json.id formation.teacher.id
      json.first_name formation.teacher.first_name
      json.last_name formation.teacher.last_name
      json.birthdate formation.teacher.birthdate
      json.gender formation.teacher.gender
      json.address formation.teacher.address
      json.city formation.teacher.city
      json.zip_code formation.teacher.zip_code
      json.expertise formation.teacher.expertise
    end
  end
end
