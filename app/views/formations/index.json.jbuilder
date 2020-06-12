
json.array! @formations do |formation|
  json.formation do
    json.id formation.id
    json.title formation.title
    json.description formation.description
  end

end
