class MessagesController < ApplicationController
  before_action :authorize

  def index
    @messages = Message.all
  end

  def create
    message = current_user.messages.build message_params
    broadcast_message(message) if message.save
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def broadcast_message(message)
    ActionCable.server.broadcast 'chat_channel',
                                 message: render_message(message)
  end

  def render_message(message)
    render(partial: 'messages/message', locals: { message: message })
  end
end
