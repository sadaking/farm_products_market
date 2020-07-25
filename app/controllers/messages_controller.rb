class MessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @message = Message.new(message_params)
    if user_signed_in?
      @message.is_user = true
    elsif producer_signed_in?
      @message.is_user = false
    end
    @message.room_id = @room.id
    if @message.save
      redirect_to room_url(@room)
    else
      redirect_to room_url(@room)
    end
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
