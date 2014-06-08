class CouponeSerializer < ActiveModel::Serializer
  attributes :id, :number_of_available, :description, :restaurant_id, :available_from, :ends_at
  has_one :restaurant
end