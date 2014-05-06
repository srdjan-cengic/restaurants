json.array!(@votes) do |vote|
  json.extract! vote, :id, :vote_type, :restaurant_id, :user_id
  json.url vote_url(vote, format: :json)
end
