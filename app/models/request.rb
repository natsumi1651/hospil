class Request < ApplicationRecord

  validates :title, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :expected_length, presence: true
  validates :expected_place, presence: true

end
