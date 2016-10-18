class Account < ApplicationRecord
  belongs_to :user
  has_one    :cart

  validates :balance, numericality: { greater_than_or_equal_to: 0 }
end
