class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(id: params[:user][:id])
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end