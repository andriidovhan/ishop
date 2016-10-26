class Cart < ApplicationRecord
  belongs_to :account, optional: true

  has_and_belongs_to_many :products
end
