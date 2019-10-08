class CommentsController < ApplicationController
  before_action :check_login, only: :create

  def create
    @comment = current_user.comments.build comment_params
    if @comment.save
      flash[:success] = t "comment.create.comment_sucess"
    else
      flash[:danger] = t "comment.create.comment_error"
    end
    respond_to do |format|
      format.html{redirect_back fallback_location: root_path}
      format.js
    end
  end

  private

  def comment_params
    params[:comment][:post_id] = params[:post_id]
    params.require(:comment).permit :content, :post_id, :comment_id
  end
end
