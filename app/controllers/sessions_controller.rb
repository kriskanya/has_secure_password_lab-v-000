class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    return head(:forbidden) unless @user.authenticate(params[:user][:password])
    
    session[:user_id] = @user.id
    redirect_to controller: 'users', action: 'welcome'
  end

end