class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]
  def index

    @users = User.all
  end

  def update
    if @user.update(item_params)
      redirect_to users_path, success: 'Role has been updated'
    else
      render 'index'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def item_params
    params.require(:user).permit(:email, :role)
  end

end
