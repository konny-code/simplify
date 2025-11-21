class TranslationsController < ApplicationController
  # Login via ApplicationController
  before_action :set_article
def create
  @translation = Translation.new(translation_params)
  @translation.article = @article
  @translation.user = current_user
  @translation.save
  redirect_to article_path(@article), notice: "Saved #{@translation.word}!"
end

def destroy
  @translation = Translation.find(params[:id])
  @translation.destroy
  redirect_to article_path(@translation.article), notice: "Removed Favorite"
end

  private

  def set_article
    # Ensures the article belongs to the logged-in user
    @article = current_user.articles.find(params[:article_id])
  end

  def translation_params
    # reading is now persisted as well
    params.require(:translation).permit(:word, :definition, :reading)
  end
end
