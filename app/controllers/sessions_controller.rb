class SessionsController < ApplicationController
  before_action :load_user, only: :create

  def new; end

  def create
    if @user.authenticate params[:session][:password]
      flash[:success] = t "sessions.new.success"
      log_in @user
      redirect_back fallback_location: root_path
    else
      flash[:danger] = t "sessions.new.password_wrong"
      render :new
    end
  end

  private

  def load_user
    @user = User.find_by email: params[:session][:email]
    return if @user

    flash[:danger] = t "sessions.new.email_wrong"
    render :new
  end
end
