class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.all
  end

  def create
    post = Post.new
    
    post.title = params[:title]
    post.content = params[:content]
    
    post.user_id = params[:user]
    post.save
    
    redirect_to "/"
  end

  def edit
    @edit_post = Post.find(params[:id])
  end

  def update
    edit_post = Post.find(params[:id])
    edit_post.title = params[:title]
    edit_post.content = params[:content]
    edit_post.save
    
    redirect_to '/'
  end

  def destroy
    destroy_post = Post.find(params[:id])
    destroy_post.destroy
    
    redirect_to "/"
  end

end
