class ProducersController < ApplicationController
  def show
    @producer = Producer.find(params[:id])

    if user_signed_in?
      @favorite_person = current_user.favorite_persons.find_by(producer_id: @producer.id)
    end
  end
end
