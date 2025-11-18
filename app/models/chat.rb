class Chat < ApplicationRecord
  belongs_to :article
  has_many :messages
end
