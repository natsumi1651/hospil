class Request < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :title, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :expected_length, presence: true
  validates :expected_place, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image
  has_many_attached :images

  def self.search(search)
    if search != ''
      Request.where('title LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%")
    else
      Request.all
    end
  end
end
