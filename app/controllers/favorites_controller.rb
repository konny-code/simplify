class FavoritesController < ApplicationController
  # Login via ApplicationController

  def index
    @favorites = current_user
                   .favorites
                   .includes(translation: :article)
                   .order(created_at: :desc)
  end

  def create
    @translation = Translation.find(params[:translation_id])

    # Only Favorite words from current user's articles
    if @translation.article.user_id != current_user.id
      redirect_back fallback_location: root_path,
                    alert: "You can only Favorite your own article translations."
      return
    end

    # One Favorite per Translation per User
    @favorite = current_user.favorites.find_or_initialize_by(
      translation: @translation
    )

    if @favorite.persisted? || @favorite.save
      redirect_back fallback_location: favorites_path,
                    notice: "Saved to Favorites."
    else
      redirect_back fallback_location: article_path(@translation.article),
                    alert: "Could not save Favorite."
    end
  end
end
