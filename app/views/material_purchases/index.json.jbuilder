json.array!(@material_purchases) do |material_purchase|
  json.extract! material_purchase, :id, :units, :exp_date, :amount
  json.url material_purchase_url(material_purchase, format: :json)
end
