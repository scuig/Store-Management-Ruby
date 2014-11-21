json.array!(@discounts) do |discount|
  json.extract! discount, :id, :name, :percentage
  json.url discount_url(discount, format: :json)
end
