class BlogsController < ApplicationController
  before_action :authenticate_producer!
  before_action :set_blog, only: %i(show edit update destroy)

  def index
    @blogs = Blog.order(id: :desc)
  end

  def new
    @blog = current_producer.blogs.build
  end

  def create
    @blog = current_producer.blogs.build(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "投稿しました！"
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: '編集しました！'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: '投稿を削除しました'
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit %i(title content)
  end
end
