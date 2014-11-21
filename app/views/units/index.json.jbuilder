json.array!(@units) do |unit|
  json.extract! unit, :id, :name, :abbr
  json.url unit_url(unit, format: :json)
end
