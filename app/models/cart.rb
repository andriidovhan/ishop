class Cart < ApplicationRecord
  belongs_to :account

  has_and_belongs_to_many :products
end
