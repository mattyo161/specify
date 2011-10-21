class AnatomicEntitiesController < ApplicationController
  def index
    @anatomic_entities = AnatomicEntity.all # current_user.templates.map { |t| t.anatomic_entities }.flatten # AnatomicEntity.find(:all, :conditions => 'user_id LIKE ' + current_user.id.to_s)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @anatomic_entities }
      format.js { render :layout => false }
    end
  end

  def show
    @anatomic_entity = AnatomicEntity.find(params[:id])
    respond_to do |format|
      format.html { render :partial => '/anatomic_entities/list', :collection => [@anatomic_entity] } # show.html.erb
      format.xml  { render :xml => @anatomic_entity }
      format.js { render :layout => false }
    end
  end

  def new
    @anatomic_entity = AnatomicEntity.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @anatomic_entity }
      format.js { render :layout => false }
    end
  end

  def edit
    @anatomic_entity = AnatomicEntity.find(params[:id])
  end

  def create
    @anatomic_entity = AnatomicEntity.new(params[:anatomic_entity])
    respond_to do |format|
      if @anatomic_entity.save
        @anatomic_entities = AnatomicEntity.all
        flash[:notice] = "<br>Created anatomic entity <%= AnatomicEntity.last.id.to_s %>"
        # @anatomic_entities = AnatomicEntity.all.find_all { |ae| ae.template.user_id.to_s == current_user.id.to_s }
        format.html { render :text => 'why html?' }
        format.js { render :layout => false }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @anatomic_entity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @anatomic_entity = AnatomicEntity.find(params[:id])
    respond_to do |format|
      if @anatomic_entity.update_attributes(params[:anatomic_entity])
        flash[:notice] = 'AnatomicEntity was successfully updated.'
        format.html { redirect_to '/' } # { redirect_to(@anatomic_entity) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @anatomic_entity.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @anatomic_entity = AnatomicEntity.find(params[:id])
    @anatomic_entity.destroy
    respond_to do |format|
      format.html { redirect_to(anatomic_entities_url) }
      format.xml  { head :ok }
    end
  end
end
