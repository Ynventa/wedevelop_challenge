class Client < ApplicationRecord

  validates :first_name, :last_name, presence: true
  validates :first_name, :last_name, length: { maximum: 200 }
end
