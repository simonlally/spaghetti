class MessagesController < ApplicationController
  def create
    @message = Current.user.messages.build(content: message_params[:content])
    @message.save
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
