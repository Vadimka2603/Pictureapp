class SessionsController < ApplicationController
  
  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user
    else
      
      redirect_to '/login', notice: 'Неверный логин/пароль'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def new
  end
end