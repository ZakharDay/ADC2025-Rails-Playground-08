class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  has_many :likes, as: :likeable

  has_many :reactions
  has_many :reacted_users, through: :reactions, source: :user

  validates :title, presence: true, length: { minimum: 5 }
  mount_uploader :cover, PostCoverUploader
  
  acts_as_taggable_on :tags
  acts_as_taggable_on :categories
end
