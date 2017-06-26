class PostsController < ApplicationController
  before_action :require_logged_in


  def new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      params[:sub_ids].each do |sub|
        Postsub.create!(post_id: @post.id, sub_id: sub)
      end
    else
      flash[:errors] = @post.errors.full_messages
    end
    redirect_to sub_url(params[:sub_ids].first)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.author_id != current_user.id
      flash[:errors] = ["You are not the author of this post!"]
      redirect_to sub_url(@post.sub_id)
    else
      if @post.update_attributes(post_parms)
        redirect_to sub_url(@post.sub_id)
      else
        flash[:errors] = @post.errors.full_messages
        redirect_to sub_url(@post.sub_id)
      end
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:errors] = @post.errors.full_messages
    redirect_to sub_url(@post.subs.first)
  end

  def post_params
    params.require(:post).permit(:title, :url, :content, :sub_id, :sub_ids)
  end
end
