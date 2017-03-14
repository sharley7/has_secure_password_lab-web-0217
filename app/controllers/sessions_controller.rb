class SessionsController < ApplicationController

  def create
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    if user
    session[:user_id] = user.id
    @user = user
    redirect_to '/welcome'
  else
    return head(:forbidden)
    redirect_to '/login'
  end
end

  def new
    @user = User.new
  end

  def destroy
    session.delete :user_id
    redirect_to '/welcome'
  end

end
