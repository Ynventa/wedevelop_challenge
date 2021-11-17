
class OrderSerializer < ActiveModel::Serializer
  attributes :id, :price, :datetime

  belongs_to :client
  belongs_to :book
end    

