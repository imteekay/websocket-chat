class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @conversation = Conversation.find(params[:id])
  end

  def new
    @other_user = User.find(params[:other_user_id])
  end

  def create
    message = current_user.messages.build(message_params)

    if message.save
      redirect_to conversation_path(message.conversation)
    else
      redirect_to new_conversation_message_path
    end
  end

  private

  def message_params
    params.require(:message)
          .permit(:content)
          .merge(conversation: Conversation.create)
  end
end
