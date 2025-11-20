class TranslationsController < ApplicationController
  # Login via ApplicationController
  before_action :set_article

  def create
    @translation = @article.translations.new(translation_params)

    if @translation.save
      respond_to do |format|
        format.turbo_stream
        format.json { render json: @translation, status: :created }
        format.html { redirect_to article_path(@article) }
      end
    else
      respond_to do |format|
        format.json { render json: @translation.errors, status: :unprocessable_entity }
        format.html do
          redirect_to article_path(@article),
                      alert: "Could not save Translation."
        end
      end
    end
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



# class TranslationsController < ApplicationController
#   # Login via ApplicationController
#   before_action :set_article

#   def create
#     @translation = @article.translations.new(translation_params)

#     if @translation.save
#       respond_to do |format|
#         format.turbo_stream
#         format.json { render json: @translation, status: :created }
#         format.html { redirect_to article_path(@article) }
#       end
#     else
#       respond_to do |format|
#         format.json { render json: @translation.errors, status: :unprocessable_entity }
#         format.html { redirect_to article_path(@article),
#                                  alert: "Could not save Translation." }
#       end
#     end
#   end

#   private

#   def set_article
#     # Article belongs to the logged-in user
#     @article = current_user.articles.find(params[:article_id])
#   end

#   def translation_params
#     params.require(:translation).permit(:word, :definition)
#   end
# end
