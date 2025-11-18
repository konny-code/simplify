class Favorite < ApplicationRecord
  belongs_to :translation
  belongs_to :user

end
