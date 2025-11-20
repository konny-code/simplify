class FavoritesController < ApplicationController
  # Login via ApplicationController

  def index
    @favorites = current_user
                   .favorites
                   .includes(translation: :article)
                   .order(created_at: :desc)
  end

  def create
    # CASE A: translation_id passed directly (old behavior)
    if params[:translation_id].present?
      @translation = Translation.find(params[:translation_id])

      # Safety: only allow favoriting own article's translations
      if @translation.article.user_id != current_user.id
        redirect_back fallback_location: root_path,
                      alert: "You can only Favorite your own article translations."
        return
      end

    # CASE B: new popover behavior: favorite[word, meaning, reading, article_id]
    elsif params[:favorite].present?
      fav = params.require(:favorite).permit(:word, :meaning, :article_id, :reading)

      # Article must belong to current user
      article = current_user.articles.find(fav[:article_id])

      # 1. Find or create a translation for this word/meaning in this article
      @translation = article.translations.find_or_create_by(
        word:       fav[:word],
        definition: fav[:meaning]
      )

      # 2. Enrich translation with reading if we have one and it's blank
      if fav[:reading].present? && @translation.reading.blank?
        @translation.update(reading: fav[:reading])
      end
    else
      redirect_back fallback_location: root_path,
                    alert: "Invalid Favorite request."
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



# older controller code commented out
#
# class FavoritesController < ApplicationController
  # Login via ApplicationController

#   def index
#     @favorites = current_user
#                    .favorites
#                    .includes(translation: :article)
#                    .order(created_at: :desc)
#   end

#   def create
#     @translation = Translation.find(params[:translation_id])

#     # Only Favorite words from current user's articles
#     if @translation.article.user_id != current_user.id
#       redirect_back fallback_location: root_path,
#                     alert: "You can only Favorite your own article translations."
#       return
#     end

#     # One Favorite per Translation per User
#     @favorite = current_user.favorites.find_or_initialize_by(
#       translation: @translation
#     )

#     if @favorite.persisted? || @favorite.save
#       redirect_back fallback_location: favorites_path,
#                     notice: "Saved to Favorites."
#     else
#       redirect_back fallback_location: article_path(@translation.article),
#                     alert: "Could not save Favorite."
#     end
#   end
# end
