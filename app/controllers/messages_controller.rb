class MessagesController < ApplicationController
  # Login via ApplicationController
  before_action :set_chat
  before_action :set_article

  SYSTEM_PROMPT = "You are a Teaching Assistant.\n\nI am a student at the Le Wagon AI Software Development Bootcamp, learning how to code.\n\nHelp me break down my problem into small, actionable steps, without giving away solutions.\n\nAnswer concisely in Markdown."
  def create

    @chat = Chat.find(params[:chat_id])
    @article = @chat.article
    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      @ruby_llm_chat = RubyLLM.chat
      build_conversation_history
      response = @ruby_llm_chat.with_instructions(instructions).ask(@message.content)
      Message.create(role: "assistant", content: response.content, chat: @chat)

      respond_to do |format|
      format.html { redirect_to chat_path(@chat) }
      format.turbo_stream { render 'create' }
      end
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def set_article
    @article = @chat.article
  end

  def build_conversation_history
    @chat.messages.each do |message|
      @ruby_llm_chat.add_message(
        role: message.role,
        content: message.content)
    end
  end

  def instructions
    article_context = "Here is the context of the article: #{@article.content}."
    [SYSTEM_PROMPT, article_context].compact.join("\n\n")
  end


  def message_params
    params.require(:message).permit(:content)
  end

  # def create
  #   @message       = @chat.messages.new(message_params)
  #   @message.role ||= "user"

  #   if @message.save
  #     # Call AI and add assistant reply here
  #     redirect_to chat_path(@chat)
  #   else
  #     redirect_to chat_path(@chat),
  #                 alert: "Could not send Message."
  #   end
  # end

  # private

  # def set_chat
  #   # Chat belongs to < article of < the current user
  #   @chat = Chat.joins(:article)
  #               .where(articles: { user_id: current_user.id })
  #               .find(params[:chat_id])
  # end

  # def message_params
  #   params.require(:message).permit(:content, :role)
  # end
end
