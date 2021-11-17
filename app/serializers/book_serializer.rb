
class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :stock, :price

  belongs_to :author
end    

