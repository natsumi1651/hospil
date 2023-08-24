FactoryBot.define do
  factory :request do
    title              {'テスト件名'}
    date               {'000000'}
    category           { Category.find_by(id: 2) }
    description        {'テスト投稿'}
    expected_length    {'1時間'}
    expected_place     {'ユーザー住所'}
    association :user
  end

end
