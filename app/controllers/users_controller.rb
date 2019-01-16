class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :find_user, only: %i[edit update destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_user_not_found

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to tests_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy

    redirect_to users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def rescue_with_user_not_found
    flash[:alert] = 'User not found'

    redirect_to root_path
  end
end
