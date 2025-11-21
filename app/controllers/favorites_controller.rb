class FavoritesController < ApplicationController
  # Login via ApplicationController

  def index
    @favorites = current_user
                   .favorites
                   .includes(translation: :article)
                   .order(created_at: :desc)
  end
end
