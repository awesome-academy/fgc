class PostsController < ApplicationController
  before_action :load_post, only: :show

  def index; end

  def show; end

  def new; end

  private

  def load_post
    @post = Post.find_by id: params[:id]
    return if @post
    flash[:danger] = t ".post_not_found"
    redirect_to root_path
  end
end
