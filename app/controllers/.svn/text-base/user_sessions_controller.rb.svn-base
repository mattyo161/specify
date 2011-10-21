# require 'ssl_requirement'	
class UserSessionsController < ApplicationController
  # include SslRequirement
  before_filter :require_no_user, :only => [:new, :create, :reset]
  before_filter :require_user, :only => :destroy
  #def ssl_required?
  #  true
  #end
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      # flash[:notice] = "Login Successful"
      # redirect_back_or_default account_url
      redirect_to '/'
    else
      @error = 'login unsuccessful: ' + @user_session.errors.full_messages.to_s
      render :action => :new
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout Successful"
    redirect_back_or_default new_user_session_url
  end
end
