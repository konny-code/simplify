class PagesController < ApplicationController
  def home
    @article = Article.new
  end
end
