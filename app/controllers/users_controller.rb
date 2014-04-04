class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'Profile upated successfully'
    else
      flash.now[:alert] = "Error! Unable to update profile."
    end
    render 'show'
  end

  protected

  def user_params
    params.require(:user).permit(:preferred_fighting, :preferred_roles, :other)
  end

end
