class MessageTopsController < ApplicationController
  def index
    if user_signed_in?
      @producers = Producer.all
      rooms = current_user.rooms
      @producer_ids = []
      rooms.each do |room|
        @producer_ids << room.producer_id
      end
    elsif producer_signed_in?
      @users = User.all
      rooms = current_producer.rooms
      @user_ids = []
      rooms.each do |room|
        @user_ids << room.user_id
      end
    end
  end
end
