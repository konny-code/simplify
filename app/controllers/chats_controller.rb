class ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    @article = Article.find(params[:article_id])
    @chat = Chat.new
    @chat.article = @article

    if @chat.save
      redirect_to chat_path(@chat)
    else
      render "articles/show"
    end
  end

  def show
      @chat = Chat.find(params[:id])
      @article = @chat.article
      @message = Message.new
  end

end
