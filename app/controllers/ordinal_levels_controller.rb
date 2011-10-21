class OrdinalLevelsController < ApplicationController
  # GET /ordinal_levels
  # GET /ordinal_levels.xml
  def index
    @ordinal_levels = OrdinalLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ordinal_levels }
    end
  end

  # GET /ordinal_levels/1
  # GET /ordinal_levels/1.xml
  def show
    @ordinal_level = OrdinalLevel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ordinal_level }
    end
  end

  # GET /ordinal_levels/new
  # GET /ordinal_levels/new.xml
  def new
    @ordinal_level = OrdinalLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ordinal_level }
    end
  end

  # GET /ordinal_levels/1/edit
  def edit
    @ordinal_level = OrdinalLevel.find(params[:id])
  end

  # POST /ordinal_levels
  # POST /ordinal_levels.xml
  def create
    @ordinal_level = OrdinalLevel.new(params[:ordinal_level])

    respond_to do |format|
      if @ordinal_level.save
        flash[:notice] = 'OrdinalLevel was successfully created.'
        format.html { redirect_to(@ordinal_level) }
        format.xml  { render :xml => @ordinal_level, :status => :created, :location => @ordinal_level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ordinal_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ordinal_levels/1
  # PUT /ordinal_levels/1.xml
  def update
    @ordinal_level = OrdinalLevel.find(params[:id])

    respond_to do |format|
      if @ordinal_level.update_attributes(params[:ordinal_level])
        flash[:notice] = 'OrdinalLevel was successfully updated.'
        format.html { redirect_to(@ordinal_level) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ordinal_level.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ordinal_levels/1
  # DELETE /ordinal_levels/1.xml
  def destroy
    @ordinal_level = OrdinalLevel.find(params[:id])
    @ordinal_level.destroy

    respond_to do |format|
      format.html { redirect_to(ordinal_levels_url) }
      format.xml  { head :ok }
    end
  end
end
