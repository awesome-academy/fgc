class UsersController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = t "users.new.regis_success"
      redirect_back fallback_location: root_path
    else
      flash[:success] = "users.new.regis_fail"
      render :new
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit :email, :name,
      :password, :password_confirmation
  end
end
