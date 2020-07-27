class Pairing < ApplicationRecord
  
  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :title, presence: true, length: {maximum: 50}
  validates :caption, presence: true, length: {maximum: 200}
  validates :image, presence: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
