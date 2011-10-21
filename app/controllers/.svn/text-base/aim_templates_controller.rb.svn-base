class AimTemplatesController < ApplicationController
  # GET /templates
  # GET /templates.xml
  def index
    @aim_templates = current_user.templates # AimTemplate.find(:all, :conditions => 'user_id LIKE ' + current_user.id.to_s)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @aim_templates }
    end
  end

  # GET /templates/1
  # GET /templates/1.xml
  def show
    @aim_template1 = AimTemplate.find(params[:id])
    respond_to do |format|
      format.html { render :partial => '/templates/list', :collection => [@aim_template1] } # show.html.erb
      format.xml  { render :xml => @aim_template1 }
    end
  end

  # GET /templates/new
  # GET /templates/new.xml
  def new
    @new_template = AimTemplate.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @new_template }
      format.js # { render :layout => false }      
    end
  end

  # GET /templates/1/edit
  def edit
    @aim_template = AimTemplate.find(params[:id])
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  # POST /templates
  # POST /templates.xml
  def create
    @new_template = AimTemplate.new(params[:aim_template].merge({:user_id => current_user.id.to_s, :creationDate => Date.today.strftime('%Y-%m-%d'), :authors => current_user.login }))
    # @aim_templates = AimTemplate.find(:all, :conditions => 'user_id LIKE ' + current_user.id.to_s)
    respond_to do |format|
      if @new_template.save
        # flash[:notice] = "<br>Created template <%= AimTemplate.last.id.to_s %>"
        # @aim_templates = AimTemplate.find(:all, :conditions => 'user_id LIKE ' + current_user.id.to_s)
        format.html { render :file => '/main/templates_tab.html.erb' }
        format.js # { render :layout => false }
        #        format.html { redirect_to(@new_template) }
        #        format.xml  { render :xml => @new_template, :status => :created, :location => @new_template }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @new_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /templates/1
  # PUT /templates/1.xml
  def update
    @aim_template = AimTemplate.find(params[:id])
    @template_container = TemplateContainer.find(params[:container_id]) rescue nil
    respond_to do |format|
      if @aim_template.update_attributes(params[:aim_template])
        flash[:notice] = 'AimTemplate was successfully updated.'
        format.html { redirect_to '/' } # { redirect_to(@aim_template) }
        format.xml  { head :ok }
        format.js { render :layout => false }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @aim_template.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /templates/1
  # DELETE /templates/1.xml
  def destroy
    @aim_template = AimTemplate.find(params[:id])
    @aim_template.destroy
    @aim_template = nil # so that the view resets
    @template_container = TemplateContainer.find(params[:container_id]) rescue nil
    respond_to do |format|
      format.html { redirect_to(templates_url) }
      format.xml  { head :ok }
      format.js { render :layout => false }
    end
  end

  def copy
    at = params[:id].blank? ? nil : AimTemplate.find(params[:id])
    at2 = copy_template(at)
    # @aim_template = AimTemplate.new(at.attributes) # Marshal.dump(at)
    respond_to do |format|
      at2.update_attributes(:authors => current_user.login, :name => at.name + ' copy', :creationDate => Date.today.strftime('%Y-%m-%d'))
      @template_container = params[:template_container_id] == 'null' ? nil : TemplateContainer.find(params[:template_container_id])
      @aim_templates = current_user.aim_templates
      format.html { redirect_to('/') }
      # format.html render :update do |page|; page.replace_html('templateContainerList', :file => '/main/template_group_list.html.erb') ; end  # :partial => '', :collection => @users }
      format.xml  { render :xml => @aim_template, :status => :created, :location => @aim_template }
      format.js { render :layout => false } # render :mime_type => Mime::Type.lookup("application/javascript")
    end if at && at2
    # render :nothing => true
  end
end
