json.array!(@sales) do |sale|
  json.extract! sale, :id, :saleDate
  json.url sale_url(sale, format: :json)
end
