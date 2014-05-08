class VoteSerializer < ActiveModel::Serializer
  attributes :id, :vote_type, :restaurant_id, :user_id
end
