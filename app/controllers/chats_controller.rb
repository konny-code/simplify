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
      @message = Message.new
  end

end


   #   # Find  Article of < the current user
  #   @article = current_user.articles.find(params[:article_id])

  #   # Create a New Chat every time (An Article has many Chats)
  #   @chat = @article.chats.new(
  #     title: params[:title].presence || "Chat about this Article"
  #   )

  #   if @chat.save
  #     redirect_to chat_path(@chat)
  #   else
  #     redirect_to article_path(@article),
  #                 alert: "Could not start Chat."
  #   end
  # rescue ActiveRecord::RecordNotFound
  #   redirect_back fallback_location: root_path,
  #                 alert: "Article not found or not accessible."


  #   # Chats only for < Aarticle of < current user
  #   @chat = Chat.joins(:article)
  #               .where(articles: { user_id: current_user.id })
  #               .find(params[:id])

  #   @article  = @chat.article
  #   @messages = @chat.messages.order(:created_at)
  #   @message  = Message.new
  # end
