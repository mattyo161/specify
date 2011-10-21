class TemplateContainersController < ApplicationController
  # GET /template_containers
  # GET /template_containers.xml
  def index
    @template_containers = TemplateContainer.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @template_containers }
    end
  end

  # GET /template_containers/1
  # GET /template_containers/1.xml
  def show
    @template_container = TemplateContainer.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @template_container }
    end
  end

  # GET /template_containers/new
  # GET /template_containers/new.xml
  def new
    @template_container = TemplateContainer.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @template_container }
    end
  end

  # GET /template_containers/1/edit
  def edit
    @template_container = TemplateContainer.find(params[:id])
  end

  def remove_included_template
    @template_container = TemplateContainer.find(params[:container_id])
    @aim_template = AimTemplate.find(params[:id])
    @template_container.aim_templates -= [@aim_template]
    respond_to do |format|
      format.js { render :file => 'template_containers/update_included_templates.js.erb' }
    end
  end

  def copy
    tc = TemplateContainer.find(params[:id])
    @template_container = TemplateContainer.new(tc.attributes)
    respond_to do |format|
      if @template_container.save
        @template_container.update_attributes({:user_id => current_user.id.to_s, :creationDate => Date.today.strftime('%Y-%m-%d'), :authors => current_user.login, :name => @template_container.name + ' copy'})
        @template_container.aim_templates = tc.aim_templates
        @template_containers = current_user.template_containers
        format.html { redirect_to('/') }
        # format.html render :update do |page|; page.replace_html('templateContainerList', :file => '/main/template_group_list.html.erb') ; end  # :partial => '', :collection => @users }
        format.xml  { render :xml => @template_container, :status => :created, :location => @template_container }
        format.js { render :layout => false } # render :mime_type => Mime::Type.lookup("application/javascript")
      end
    end
  end
  # POST /template_containers
  # POST /template_containers.xml
  def create
    # @template_container = TemplateContainer.new(params[:template_container])
    @template_container = TemplateContainer.new(params[:template_container].merge({:user_id => current_user.id.to_s, :creationDate => Date.today.strftime('%Y-%m-%d'), :authors => current_user.login }))
    respond_to do |format|
      if @template_container.save
        @template_containers = TemplateContainer.find(:all, :conditions => 'user_id LIKE ' + current_user.id.to_s)
        # flash[:notice] = 'TemplateContainer was successfully created.'
        format.html { redirect_to('/') }
        # format.html render :update do |page|; page.replace_html('templateContainerList', :file => '/main/template_group_list.html.erb') ; end  # :partial => '', :collection => @users }        
        format.xml  { render :xml => @template_container, :status => :created, :location => @template_container }
        format.js { render :layout => false } # render :mime_type => Mime::Type.lookup("application/javascript")
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @template_container.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update_included_templates
    @template_container = TemplateContainer.find(params[:id])
    aim_templates0 = @template_container.aim_templates
    aim_templates = AimTemplate.find(params[:aim_template]) if params[:aim_template]
    aim_templates = [aim_templates ? aim_templates : []].flatten
    @template_container.aim_templates = aim_templates
    (aim_templates0 - aim_templates).each { |aim_template| aim_template.template_containers -= @template_container }
    #aim_templates0.each do |aim_template|
    #  aim_template.template_containers |= [@template_container]
    #   |= [aim_template]
    #end
    respond_to do |format|
      # format.html { render :layout => false } #{ render :file => '/template_containers/included_templates.html.erb' }
      format.js { render :layout => false }
    end
  end
  def included_templates
    @params = params # params[:id]
    #if params[:id]
    @template_container = TemplateContainer.find(params[:id]) rescue nil
    @template_container.aim_templates.each do |aimtemplate|
      aimtemplate.template_containers |= [@template_container]
      @template_container.aim_templates |= [aimtemplate]
    end if @template_container
    respond_to do |format|
      format.html { render :layout => false } #{ render :file => '/template_containers/included_templates.html.erb' }
      format.js { render :layout => false }
    end
    #elsif params[:aim_template]
    #end
  end

  # PUT /template_containers/1
  # PUT /template_containers/1.xml
  def update
    @template_container = TemplateContainer.find(params[:id])

    respond_to do |format|
      if @template_container.update_attributes(params[:template_container])
        flash[:notice] = 'TemplateContainer was successfully updated.'
        format.html { redirect_to(@template_container) }
        format.xml  { head :ok }
        format.js { render :layout => false }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @template_container.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /template_containers/1
  # DELETE /template_containers/1.xml
  def destroy
    @template_container = TemplateContainer.find(params[:id])
    @template_container.destroy
    respond_to do |format|
      format.html { redirect_to(template_containers_url) }
      format.xml  { head :ok }
      format.js { render :layout => false }
    end
  end
end
