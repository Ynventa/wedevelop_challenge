class Order < ApplicationRecord
  belongs_to :client
  belongs_to :book

  validates :client_id, :book_id, presence: true

  before_create :subtract_from_stock
  before_validation :update_order_fields

  private
  def update_order_fields
    self.price = book.price
    self.datetime = DateTime.now()
  end

  def subtract_from_stock
    book.stock = book.stock - 1
    book.save!
  end
end