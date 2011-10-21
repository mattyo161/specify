class TemplateStoresController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :edit, :update]
  def index
    @template_stores = TemplateStore.find(:all, :conditions => 'user_id LIKE ' + current_user.id.to_s)
  end
  
  def new
    @template_store = TemplateStore.new
    respond_to do |format|
      format.html { render :text => 'http://localhost:3000/template_stores/new, html' }
      format.js { render :layout => false }
      # format.js { render :file => '/template_stores/new.js.erb' }
    end
  end

  def create
    TemplateStore.create!(:user_id => current_user.id, :templatetext => params[:template_text])
    flash[:notice] = "<br>Created template <%= TemplateStore.last.id.to_s %>"
    @template_stores = TemplateStore.find(:all, :conditions => 'user_id LIKE ' + current_user.id.to_s)
    respond_to do |format|
      format.html 
      format.js { render :layout => false }
    end
  end

  def show
  end

  def edit
  end

  def update
  end
end
