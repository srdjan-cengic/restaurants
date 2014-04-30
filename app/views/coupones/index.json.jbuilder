json.array!(@coupones) do |coupone|
  json.extract! coupone, :id, :description, :number_of_available, :restaurant_id
  json.url coupone_url(coupone, format: :json)
end
