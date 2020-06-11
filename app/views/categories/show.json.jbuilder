json.category do
  json.title @category.title
  json.creator do
    json.first_name @category.creator.first_name
    json.last_name @category.creator.last_name
  end

  json.formations @formations.each do |formation|
    json.title formation.title
    json.description formation.description
    json.teacher do |teacher|
      json.first_name teacher.first_name
      json.last_name teacher.last_name
    end
    json.creator do |creator|
      json.first_name creator.first_name
      json.last_name creator.last_name
      json.birthdate creator.birthdate
      json.gender creator.gender
      json.address creator.address
      json.city creator.city
      json.zip_code creator.zip_code
    end
  end
end
