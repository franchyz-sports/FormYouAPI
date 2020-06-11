json.admin do
  json.first_name @admin.first_name
  json.last_name @admin.last_name
  json.birthdate @admin.birthdate
  json.gender @admin.gender
  json.address @admin.address
  json.city @admin.city
  json.zip_code @admin.zip_code

  json.rooms @rooms.each do |room|
    json.name room.name
  end

  json.categories @categories.each do |category|
    json.title category.title
  end

  json.companies @companies.each do |company|
    json.name company.name
  end

  json.formations @formations.each do |formation|
    json.title formation.title
    json.description formation.description
    json.teacher do
      json.first_name formation.teacher.first_name
      json.last_name formation.teacher.last_name
    end
  end
end
