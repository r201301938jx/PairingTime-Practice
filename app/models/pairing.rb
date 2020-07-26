class Pairing < ApplicationRecord
  
  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :title, presence: true
  validates :caption, presence: true
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
