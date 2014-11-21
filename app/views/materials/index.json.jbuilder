json.array!(@materials) do |material|
  json.extract! material, :name, :id, :available, :unit_id
  json.url material_url(material, format: :json)
end
