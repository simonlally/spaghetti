class MessagesController < ApplicationController
  def create
    @message = Current.user.messages.build(content: message_params[:content])

    respond_to do |format|
      if @message.save
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "new_message",
            partial: "messages/form",
            locals: { message: Message.new }
          )
        }
      else
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace(
            "new_message",
            partial: "messages/form",
            locals: { message: @message }
          )
        }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
