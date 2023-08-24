FactoryBot.define do
  factory :user do
    nickname              {'Taro'}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    sir_name              {'山田'}
    first_name              {'太郎'}
    phone_number              {'000000'}
    address              {'神奈川県横浜市'}
  end
end