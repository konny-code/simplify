class Article < ApplicationRecord
  belongs_to :user
  has_many :translations
  has_many :chats
end
