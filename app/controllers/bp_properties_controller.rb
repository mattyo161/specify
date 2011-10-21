class BpPropertiesController < ApplicationController
  # GET /bp_properties
  # GET /bp_properties.xml
  def index
    @bp_properties = BpProperty.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_properties }
    end
  end

  # GET /bp_properties/1
  # GET /bp_properties/1.xml
  def show
    @bp_property = BpProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_property }
    end
  end

  # GET /bp_properties/new
  # GET /bp_properties/new.xml
  def new
    @bp_property = BpProperty.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_property }
    end
  end

  # GET /bp_properties/1/edit
  def edit
    @bp_property = BpProperty.find(params[:id])
  end

  # POST /bp_properties
  # POST /bp_properties.xml
  def create
    @bp_property = BpProperty.new(params[:bp_property])

    respond_to do |format|
      if @bp_property.save
        format.html { redirect_to(@bp_property, :notice => 'BpProperty was successfully created.') }
        format.xml  { render :xml => @bp_property, :status => :created, :location => @bp_property }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_properties/1
  # PUT /bp_properties/1.xml
  def update
    @bp_property = BpProperty.find(params[:id])

    respond_to do |format|
      if @bp_property.update_attributes(params[:bp_property])
        format.html { redirect_to(@bp_property, :notice => 'BpProperty was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_property.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_properties/1
  # DELETE /bp_properties/1.xml
  def destroy
    @bp_property = BpProperty.find(params[:id])
    @bp_property.destroy

    respond_to do |format|
      format.html { redirect_to(bp_properties_url) }
      format.xml  { head :ok }
    end
  end
end
