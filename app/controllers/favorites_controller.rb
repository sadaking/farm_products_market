class FavoritesController < ApplicationController
  def index
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).all
  end

  def create
    favorite = current_user.favorites.create(product_id: params[:product_id])
    redirect_to products_url, notice: "お気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to products_url, notice: "お気に入り解除しました"
  end
end
