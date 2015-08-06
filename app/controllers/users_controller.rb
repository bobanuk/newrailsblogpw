class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_filter :authenticate_user!, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    redirect_to root_path
  end

  def show
  end

  private
  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :role_id)
  end
end
