json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :description, :telephone, :fb_url, :image, :owner_id
  json.url restaurant_url(restaurant, format: :json)
end
