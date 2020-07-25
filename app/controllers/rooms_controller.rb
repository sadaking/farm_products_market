class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @message = Message.new
    @messages = @room.messages
    if user_signed_in?
      if @room.user.id == current_user.id
        @producer = @room.producer
      else
        redirect_to message_tops_path
      end
    elsif producer_signed_in?
      if @room.producer.id == current_producer.id
        @user = @room.user
      else
        redirect_to message_tops_path
      end

    else
      redirect_to message_tops_path
    end
  end

  def create
    if user_signed_in?
      @room = Room.new(room_producer_params)
      @room.user_id = current_user.id
    elsif producer_signed_in?
      @room = Room.new(room_user_params)
      @room.producer_id = current_producer.id
    else
      redirect_to message_tops_path
    end

    if @room.save
      redirect_to :action => "show", :id => @room.id
    else
      redirect_to message_tops_path
    end
  end

  private
  def room_producer_params
    params.require(:room).permit(:producer_id)
  end

  def room_user_params
    params.require(:room).permit(:user_id)
  end
end
