class V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = UserCreator.new(user_params).create_user
    if @user
      response.set_header('auth_token', @user.token)
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    unless UserUpdater.new(update_params, @user).update_user
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    unless UserDestroyer.new(@user).destroy_user
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :password)
  end

  def update_params
    params.permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
