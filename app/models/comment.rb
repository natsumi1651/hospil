class Comment < ApplicationRecord
  validates :text, presence: true

  belongs_to :request
  belongs_to :user
end
