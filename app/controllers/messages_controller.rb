class MessagesController < ApplicationController
  # Login via ApplicationController
  before_action :set_chat
  before_action :set_article

  SYSTEM_PROMPT = "You are an English teacher. If the question is about Japanese culture, customs, or other topics that may be unfamiliar to people from overseas, please explain the background as well."
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


end
