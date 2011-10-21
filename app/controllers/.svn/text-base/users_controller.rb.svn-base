class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  layout "user_sessions"
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      # flash[:notice] = "Account registered!"
      # redirect_back_or_default account_url
      redirect_to '/'
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  def reset
    if !params[:user]
      render :file => 'user_sessions/reset.erb'
    elsif params[:user][:login] && params[:user][:password] && params[:user][:password_confirmation]
      # render :text => params.to_s
      @user = User.scoped(:conditions => ['login LIKE ?', params[:user][:login]]) # User.all.find_all { |usr| usr.login == params[:user][:login] }
      @user =  @user.any? ? @user[0] : nil
      reset_check1 = @user.email == params[:user][:email] && (defined? @user) && @user != nil && params[:user][:password] == params[:user][:password_confirmation]
      # render :text => params[:email] != nil
      # render :text => user.email + ', ' + params[:email]
      # reset_check2 = user.update_attributes(:password => params[:password]) if reset_check1
      @user.password = params[:user][:password] if reset_check1 == true
      @user.password_confirmation = params[:user][:password_confirmation] if reset_check1 == true
      reset_check2 = @user.save! if reset_check1 == true
      (reset_check1 == true && reset_check2 == true) ? @error = 'password reset successful' : @error = 'password reset unsuccessful! ' # + reset_check1.to_s + ' ' + reset_check2.to_s
      render :action => '../user_sessions/new'
      # render :text => reset_check.to_s + ' ' + user.class.to_s + ' ' + (user.email == params[:email]).to_s + ' ' + (params[:password] == params[:password_confirmation]).to_s
      # flash[:error] = 'error' unless reset_check
      # redirect_to '/'
    end
    #### , { :layout => :none }
  end
end
