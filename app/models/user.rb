class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    with_options presence: true do
      validates :nickname
      validates :sir_name
      validates :first_name
      validates :phone_number
      validates :address
    end

    validates :nickname, length: { maximum: 6 }
    validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-z\d]+\z/i }

  has_many :requests
  has_many :comments
  has_many :likes
end
