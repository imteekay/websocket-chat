class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def show
    @conversation = Conversation.find(params[:id])
  end

  def new
    load_other_user
    load_conversation
    redirect_to_conversation if @conversation.present?
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

  def load_other_user
    @other_user = User.find(params[:other_user_id])
  end

  def load_conversation
    @conversation = Conversation.between(current_user, @other_user).first
  end

  def redirect_to_conversation
    redirect_to conversation_path(@conversation)
  end

  def message_params
    params.require(:message)
          .permit(:content)
          .merge(conversation: Conversation.create)
  end
end
