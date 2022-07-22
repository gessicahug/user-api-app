class V1::UsersController < ApplicationController
  skip_before_action :authenticate_request, only: %i[index show create]
  before_action :set_user, only: %i[show update destroy]
  def index
    @users = User::GetAllUsers.call
    render json: @users, status: :ok
  end

  def show
    render json: @user, status: :ok
  end

  def create
    @user = User::CreateUser.call(user_params)

    if @user
      response.set_header('auth_token', @user.token)
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if User::UpdateUser.call(params, @user)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if User::DestroyUser.call(@user)
      render json: { status: :ok }
    else
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
    @user = User::SetUser.call
  end
end
