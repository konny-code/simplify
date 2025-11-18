class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      @article.generate_content
      redirect_to article_path(@article)
    else
      render "pages/home", status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
       @article.generate_content
       redirect_to article_path(@article)
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def article_params
    params.require(:article).permit(:language_level, :original_content)
  end
end
