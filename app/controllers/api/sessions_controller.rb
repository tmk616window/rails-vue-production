class Api::SessionsController < ApplicationController
  def index
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    else
      flash[:danger] = 'Invalid email/password combination' 
    end
  end
  
  def destroy
    session[:user_id] = nil
  end
  
  def show
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def taskcomment_params
    params.require(:taskcomment).permit(:title,:comment, :task_id,:present_form)
 end


end

