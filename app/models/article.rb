class Article < ApplicationRecord
  belongs_to :user
  has_many :translations
  has_many :chats
  validates :original_content, presence: true
end
