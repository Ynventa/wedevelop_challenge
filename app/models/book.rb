class Book < ApplicationRecord
  belongs_to :author

  validates :title, :author_id, :price, :stock, presence: true
  validates :title, length: { maximum: 200 }
  validates :title, uniqueness: true

  validates :stock, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def number_of_copies
    self.stock
  end
end

