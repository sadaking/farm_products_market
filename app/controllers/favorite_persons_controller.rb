class FavoritePersonsController < ApplicationController
  def index
    @user = current_user
    @favorite_persons = FavoritePerson.where(user_id: @user.id).all
  end

  def create
    favorite_person = current_user.favorite_persons.create(producer_id: params[:producer_id])
    redirect_to products_url, notice: "生産者をお気に入り登録しました"
  end

  def destroy
    favorite_person = current_user.favorite_persons.find_by(id: params[:id]).destroy
    redirect_to products_url, notice: "生産者のお気に入りを解除しました"
  end

end
