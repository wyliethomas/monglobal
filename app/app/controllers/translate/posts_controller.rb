class Translate::PostsController < ApplicationController

  def index
    @posts = Post.all(:order => '_id')
    @select_post = "current_page_item"
  end

  def show
  end

  def new
    @post = Post.new
    @select_post = "current_page_item"
  end

  def create
    post = Post.new(params[:post])

    if post.save
      redirect_to translate_posts_path(params[:locale])
    end
  end

  def edit
    @post = Post.find(params[:id])
    @select_post = "current_page_item"
  end

  def update
    post = Post.find(params[:id])
    post.update_translation(params[:locale], params[:post])
    redirect_to translate_posts_path(params[:locale])
  end

  def destroy
  end
end
