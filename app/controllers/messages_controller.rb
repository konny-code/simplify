class MessagesController < ApplicationController
  # Login via ApplicationController
  before_action :set_chat

  def create
    @message       = @chat.messages.new(message_params)
    @message.role ||= "user"

    if @message.save
      # Call AI and add assistant reply here
      redirect_to chat_path(@chat)
    else
      redirect_to chat_path(@chat),
                  alert: "Could not send Message."
    end
  end

  private

  def set_chat
    # Chat belongs to < article of < the current user
    @chat = Chat.joins(:article)
                .where(articles: { user_id: current_user.id })
                .find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content, :role)
  end
end
