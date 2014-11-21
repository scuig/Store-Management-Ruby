json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :purchase_date
  json.url purchase_url(purchase, format: :json)
end
