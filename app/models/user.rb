class User < ApplicationRecord
  has_one :account

  has_one :cart, :through => :account

  validates :name, presence:  true, length: { minimum: 3 }
  # validates :name, presence: { message: 'blabla'}
  # validates :age, numericality: { greater_than: 0 }
  validates :age, inclusion: { in: 18..100 }
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, uniqueness: true, allow_blank: true

  after_create :create_account_for_user

  # def create_account_for_user
  #   start_balance = 250
  #   bonus_balance = 100
  #   if age >= 18
  #     create_account(balance: start_balance + bonus_balance)
  #   else
  #     create_account(balance: start_balance )
  #   end
  # end

  def create_account_for_user
    balance = age >= 18 ? 350 : 250
    create_account(balance: balance)
  end
end