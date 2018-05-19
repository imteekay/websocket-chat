class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    message = current_user.messages.build(message_params)

    if message.save
      BroadcastMessage.call(message)
      head :created
    else
      redirect_to conversation_path(params[:conversation_id])
    end
  end

  private

  def message_params
    params.require(:message)
          .permit(:content)
          .merge(conversation_id: params[:conversation_id])
  end
end
