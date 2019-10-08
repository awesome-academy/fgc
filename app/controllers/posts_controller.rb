class PostsController < ApplicationController
  before_action :load_post, only: :show
  before_action :load_root_topics, only: :new

  def index; end

  def show; end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:success] = t "posts.new.create_sucess"
      redirect_to @post
    else
      flash.now[:danger] = "posts.new.create_fail"
      load_root_topics
      render :new
    end
  end

  def load_subtopic
    @sub_topics = Topic.all_sub_topics_by_id(params[:id]).pluck :content, :id
    respond_to do |format|
      format.html
      format.json{render json: {sub_topics: @sub_topics}}
    end
  end

  private

  def load_post
    @post = Post.find_by id: params[:id]
    return if @post
    flash[:danger] = t ".post_not_found"
    redirect_to root_path
  end

  def post_params
    params.require(:post).permit :subject, :content, :topic_id
  end

  def load_root_topics
    @root_topics = Topic.root_topics.pluck :content, :id
  end
end
