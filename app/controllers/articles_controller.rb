class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      redirect_to article_path(@article)
    else
      render "pages/home"
    end
  end

  private

  def article_params
    params.require(:article).permit(:language_level, :content, :original_content, :user_id)
end

#since we are only showing the simplified article
#however, we are going to store the
