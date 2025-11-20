class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @article = Article.new
    @article = Article.new(language_level: "N5")  # N5 set to default
  end
end
