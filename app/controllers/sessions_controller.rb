class SessionsController < ApplicationController

  def signin
    @user = User.find_by(user_name:params[:user_name])
  end

  def create
    @user = User.find_by(user_name:params[:user_name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end
