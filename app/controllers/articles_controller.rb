class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    @article.content = @article.generate_content
    if @article.save
      redirect_to article_path(@article)
    else
      render "pages/home"
    end
  end

  private

  def article_params
    params.require(:article).permit(:language_level, :original_content)
  end
end
