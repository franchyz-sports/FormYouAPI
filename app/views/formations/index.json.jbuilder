
json.array! @formations do |formation|
  json.formation do
    json.title formation.title
    json.description formation.description
  end

  json.teacher formation.teacher do |teacher|
    json.first_name teacher.first_name
    json.last_name teacher.last_name
  end

  json.categories formation.categories.each do |category|
    json.category category.title
  end
end
