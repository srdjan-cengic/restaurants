class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :fb_url, :telephone
end
