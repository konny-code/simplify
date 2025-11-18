class Translation < ApplicationRecord
  belongs_to :article
  has_many :favorites
end
