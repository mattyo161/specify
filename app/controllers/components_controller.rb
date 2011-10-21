class ComponentsController < ApplicationController
  # GET /components
  # GET /components.xml

  def index
    @components = Component.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @components }
    end
  end

  # GET /components/1
  # GET /components/1.xml
  def show
    @component = Component.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @component }
    end
  end

  # GET /components/new
  # GET /components/new.xml
  def new
    @component = Component.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @component }
    end
  end

  # GET /components/1/edit
  def edit
    @component = Component.find(params[:id])
  end

  # POST /components
  # POST /components.xml
  def create
    @component = Component.new(params[:component]) if !params[:component].blank?
    @component = Component.new({:aim_template_id => params[:id]}) if params[:component].blank? && !params[:id].blank?
    @aim_template = AimTemplate.find(@component.aim_template_id)
    respond_to do |format|
      if @component.save
        # flash[:notice] = 'Component was successfully created.'
        format.html { redirect_to(@component) }
        format.xml  { render :xml => @component, :status => :created, :location => @component }
        format.js
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
        format.js
      end
    end
  end

  # PUT /components/1
  # PUT /components/1.xml
  def update
    @component = Component.find(params[:id])

    respond_to do |format|
      if @component.update_attributes(params[:component])
        flash[:notice] = 'Component was successfully updated.'
        format.html { redirect_to(@component) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @component.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /components/1
  # DELETE /components/1.xml
  def destroy
    @component = Component.find(params[:id])
    @aim_template = @component.aim_template
    @component.destroy
    respond_to do |format|
      format.html { redirect_to(components_url) }
      format.xml  { head :ok }
      format.js { render :file => '/main/update_attribute.js.erb' }
    end
  end

  def copy
    comp = params[:id].blank? ? nil : Component.find(params[:id])
    #  @component = Component.new(comp.attributes) # Marshal.dump(at)
    respond_to do |format|
      Component.last.update_attributes(:authors => current_user.login)
      @aim_template = AimTemplate.find(params[:aim_template_id])
      format.html { redirect_to('/') }
      # format.html render :update do |page|; page.replace_html('templateContainerList', :file => '/main/template_group_list.html.erb') ; end  # :partial => '', :collection => @users }
      format.xml  { render :xml => @aim_template, :status => :created, :location => @aim_template }
      format.js { render :file => '/main/update_attribute.js.erb', :layout => false } # render :mime_type => Mime::Type.lookup("application/javascript")
    end if comp && copy_component(comp)
  end

  def aim_class
    # delete_row/' + componentTypeObjectId + '?object=' + url2delete + '&aim_template_id=' + selectedTemplateId
    # '/update_attribute/' + objectId + '?object=' + objectType + '&attribute=' + attribute + '&value=' + value + '&aim_template_id=' + selectedTemplateId + '&no_refresh=true'
    # '/add_row/0/?object=' + url2add + '&parent_object=component&parent_id=' + componentId + data + '&aim_template_id=' + selectedTemplateId + '&no_refresh=true'
    component = Component.find(params[:id])
    child = component.send(component.component_type)
    child.destroy
    unless params[:object].blank?
      new_child = Object.const_get(params[:object].singularize.camelize).new
      new_child.save!
      new_child.update_attributes(:component_id => component.id)
      new_child.update_attributes(params[:data]) unless params[:data].blank?
    end
    component.update_attributes(:component_type => new_child.class.to_s.underscore) # component.set_type
    @aim_template = AimTemplate.find(params[:aim_template_id]) unless params[:aim_template_id].blank?
    respond_to do |format|
      format.js { render :file => '/main/update_attribute.js.erb' }
    end
  end

  def sort
    @components = Component.scoped(:conditions=>["aim_template_id=?", params[:id]], :order => params[:value]) unless params[:id].blank? || params[:value].blank?
    respond_to do |format|
      format.js { render :layout => false }
    end
  end
end