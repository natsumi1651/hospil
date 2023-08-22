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

  has_many :requests
  has_many :comments
end
