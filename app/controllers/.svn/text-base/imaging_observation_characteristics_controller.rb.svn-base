class ImagingObservationCharacteristicsController < ApplicationController
  # GET /imaging_observation_characteristics
  # GET /imaging_observation_characteristics.xml
  def index
    @imaging_observation_characteristics = ImagingObservation.all.map { |io| io.imaging_observation_characteristics } # ImagingObservationCharacteristic.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @imaging_observation_characteristics }
      format.js { render :layout => false }
    end
  end

  # GET /imaging_observation_characteristics/1
  # GET /imaging_observation_characteristics/1.xml
  def show
    @imaging_observation_characteristic = ImagingObservationCharacteristic.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @imaging_observation_characteristic }
      format.js { render :layout => false }
    end
  end

  # GET /imaging_observation_characteristics/new
  # GET /imaging_observation_characteristics/new.xml
  def new
    @imaging_observation_characteristic = ImagingObservationCharacteristic.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @imaging_observation_characteristic }
      format.js { render :layout => false }
    end
  end

  # GET /imaging_observation_characteristics/1/edit
  def edit
    @imaging_observation_characteristic = ImagingObservationCharacteristic.find(params[:id])
  end

  # POST /imaging_observation_characteristics
  # POST /imaging_observation_characteristics.xml
  def create
    @imaging_observation_characteristic = ImagingObservationCharacteristic.new(params[:imaging_observation_characteristic])
    respond_to do |format|
      if @imaging_observation_characteristic.save
        @imaging_observation_characteristics = ImagingObservationCharacteristic.all
        flash[:notice] = 'ImagingObservationCharacteristic was successfully created.'
        format.html { redirect_to(@imaging_observation_characteristic) }
        format.xml  { render :xml => @imaging_observation_characteristic, :status => :created, :location => @imaging_observation_characteristic }
        format.js { render :layout => false }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @imaging_observation_characteristic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /imaging_observation_characteristics/1
  # PUT /imaging_observation_characteristics/1.xml
  def update
    @imaging_observation_characteristic = ImagingObservationCharacteristic.find(params[:id])
    respond_to do |format|
      if @imaging_observation_characteristic.update_attributes(params[:imaging_observation_characteristic])
        flash[:notice] = 'ImagingObservationCharacteristic was successfully updated.'
        format.html { redirect_to(@imaging_observation_characteristic) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @imaging_observation_characteristic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /imaging_observation_characteristics/1
  # DELETE /imaging_observation_characteristics/1.xml
  def destroy
    @imaging_observation_characteristic = ImagingObservationCharacteristic.find(params[:id])
    @imaging_observation_characteristic.destroy
    respond_to do |format|
      format.html { redirect_to(imaging_observation_characteristics_url) }
      format.xml  { head :ok }
	  format.js { render :file => '/main/update_attribute.js.erb' }
    end
  end
end
