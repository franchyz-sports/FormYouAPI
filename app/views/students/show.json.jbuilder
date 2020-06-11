json.student @student do |student|
  json.id student.id
  json.first_name student.first_name
  json.last_name student.last_name
  json.birthdate student.birthdate
  json.gender student.gender
  json.address student.address
  json.city student.city
  json.zip_code student.zip_code
  json.expertise student.expertise

  json.company student.company do |company|
    json.id company.id
    json.name company.name
  end
end
