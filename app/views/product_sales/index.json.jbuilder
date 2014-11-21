json.array!(@product_sales) do |product_sale|
  json.extract! product_sale, :id, :cantidad
  json.url product_sale_url(product_sale, format: :json)
end
