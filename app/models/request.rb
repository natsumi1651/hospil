class Request < ApplicationRecord

  validates :title, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :expected_length, presence: true
  validates :expected_place, presence: true
  
  belongs_to :user
  has_many :comments

  def self.search(search)
      if search != ""
        Request.where('title LIKE ? OR description LIKE ?', "%#{search}%", "%#{search}%")
      else
        Request.all
      end
  end


  
  
end
