class MessagesController < ApplicationController
  before_action :authorize

  def index
    @messages = Message.all
  end

  def create
    @message = current_user.messages.build message_params

    if @message.save
      flash[:notice] = "on"
    else
      flash[:error] = "error"
    end
    redirect_to messages_path
  end

  private
  
  def message_params
    params.require(:message).permit(:body)
  end
end
