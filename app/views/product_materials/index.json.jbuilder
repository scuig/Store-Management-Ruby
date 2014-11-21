json.array!(@product_materials) do |product_material|
  json.extract! product_material, :id, :units
  json.url product_material_url(product_material, format: :json)
end
