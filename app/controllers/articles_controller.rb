class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end
end

#since we are only showing the simplified article
#however, we are going to store the
