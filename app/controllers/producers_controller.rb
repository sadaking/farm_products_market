class ProducersController < ApplicationController
  def show
    @producer = Producer.find(params[:id])
    unless @producer == current_producer
      redirect_to products_path, notice: '他の人のプロフィール画面へはアクセスが出来ません。'
    end
  end
end
