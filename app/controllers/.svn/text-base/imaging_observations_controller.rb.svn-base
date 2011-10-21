class ImagingObservationsController < ApplicationController
  # GET /imaging_observations
  # GET /imaging_observations.xml
  def index
    @imaging_observations = ImagingObservation.all.find_all { |io| io.template.user_id == current_user.id } # current_user.templates.map { |t| t.imaging_observations }.flatten # ImagingObservation.find(:all, :conditions => 'user_id LIKE ' + current_user.id.to_s)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @imaging_observations }
      format.js { render :layout => false }
    end
  end

  # GET /imaging_observations/1
  # GET /imaging_observations/1.xml
  def show
    @imaging_observation = ImagingObservation.find(params[:id])
    respond_to do |format|
      format.html { render :partial => '/imaging_observations/list', :collection => [@imaging_observation] } # show.html.erb
      format.xml  { render :xml => @imaging_observation }
      format.js { render :layout => false }
    end
  end

  # GET /imaging_observations/new
  # GET /imaging_observations/new.xml
  def new
    @imaging_observation = ImagingObservation.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @imaging_observation }
      format.js # { render :layout => false }      
      format.js { render :layout => false }
    end
  end

  # GET /imaging_observations/1/edit
  def edit
    @imaging_observation = ImagingObservation.find(params[:id])
  end

  # POST /imaging_observations
  # POST /imaging_observations.xml
  def create
    @imaging_observation = ImagingObservation.new(params[:imaging_observation])
    @imaging_observations = ImagingObservation.all.find_all { |io| io.template.user_id == current_user.id }
    respond_to do |format|
      if @imaging_observation.save
        flash[:notice] = "<br>Created imaging observation <%= ImagingObservation.last.id.to_s %>"
        @imaging_observations = ImagingObservation.all.find_all { |io| io.template.user_id == current_user.id }
        format.html { render :text => 'why html?' }
        format.js # { render :layout => false }
#        format.html { redirect_to(@imaging_observation) }
#        format.xml  { render :xml => @imaging_observation, :status => :created, :location => @imaging_observation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @imaging_observation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /imaging_observations/1
  # PUT /imaging_observations/1.xml
  def update
    @imaging_observation = ImagingObservation.find(params[:id])
    respond_to do |format|
      if @imaging_observation.update_attributes(params[:imaging_observation])
        flash[:notice] = 'ImagingObservation was successfully updated.'
        format.html { redirect_to '/' } # { redirect_to(@imaging_observation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @imaging_observation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /imaging_observations/1
  # DELETE /imaging_observations/1.xml
  def destroy
    @imaging_observation = ImagingObservation.find(params[:id])
    @imaging_observation.destroy
    respond_to do |format|
      format.html { redirect_to(imaging_observations_url) }
      format.xml  { head :ok }
    end
  end
end
