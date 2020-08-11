class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to products_path, notice: '他の人のプロフィール画面へはアクセスが出来ません。'
    end
  end
end
