class ArticlesController < ApplicationController

  def index
    @articles = current_user.articles.order(created_at: :desc)
  end

  def show
  @article = Article.find(params[:id])

  raw = @article.sentences

  @segments =
    case raw
    when String
      # sentences stored as JSON string → parse it
      JSON.parse(raw)
    when Array
      # if later you store it as real JSONB / Array
      raw
    else
      []
    end
  rescue JSON::ParserError
  # if the LLM ever returns bad JSON, avoid crashing
  @segments = []
  end

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      @article.generate_content
      @article.generate_sentences
      @article.generate_title
      redirect_to article_path(@article)
    else
      render "pages/home", status: :unprocessable_entity
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      @article.generate_content
      @article.generate_sentences
      @article.generate_title
      redirect_to article_path(@article)
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:language_level, :original_content)
  end
end
