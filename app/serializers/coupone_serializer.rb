class CouponeSerializer < ActiveModel::Serializer
  attributes :id, :number_of_available, :description, :restaurant_id
  has_one :restaurant
end