class Translation < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :favorites, dependent: :destroy
end
