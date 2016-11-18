class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]
  has_one :account, dependent: :destroy

  has_one :cart, :through => :account

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :name, presence:  true, length: { minimum: 3 }
  # validates :name, presence: { message: 'blabla'}
  # validates :age, numericality: { greater_than: 0 }
  # validates :age, inclusion: { in: 18..100 }
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
    # # if age.exists?
    # balance = age >= 18 ? 350 : 250
    # create_account(balance: balance)
    # # end
    create_account(balance: 250)
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(:email => data["email"]).first


    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(name: data["name"],
                         email: data["email"],
                         assword: Devise.friendly_token[0,20]
                        )
    end
    user
  end
end