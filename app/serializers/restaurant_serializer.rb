class RestaurantSerializer < ActiveModel::Serializer

  attributes :id, :name, :description, :telephone, :fb_url, :image, :address
end

