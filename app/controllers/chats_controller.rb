class ChatsController < ApplicationController
  before_action :authenticate_user!

  def show
    # Chats only for < Aarticle of < current user
    @chat = Chat.joins(:article)
                .where(articles: { user_id: current_user.id })
                .find(params[:id])

    @article  = @chat.article
    @messages = @chat.messages.order(:created_at)
    @message  = Message.new
  end

  def create
    # Find  Article of < the current user
    @article = current_user.articles.find(params[:article_id])

    # Create a New Chat every time (An Article has many Chats)
    @chat = @article.chats.new(
      title: params[:title].presence || "Chat about this Article"
    )

    if @chat.save
      redirect_to chat_path(@chat)
    else
      redirect_to article_path(@article),
                  alert: "Could not start Chat."
    end
  rescue ActiveRecord::RecordNotFound
    redirect_back fallback_location: root_path,
                  alert: "Article not found or not accessible."
  end
end
