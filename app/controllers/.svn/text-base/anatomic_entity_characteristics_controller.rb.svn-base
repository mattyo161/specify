class AnatomicEntityCharacteristicsController < ApplicationController
  # GET /anatomic_entity_characteristics
  # GET /anatomic_entity_characteristics.xml
  def index
    @anatomic_entity_characteristics = AnatomicEntity.all.map { |ae| ae.anatomic_entitity_characteristics } 
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @anatomic_entity_characteristics }
      format.js { render :layout => false }
    end
  end

  # GET /anatomic_entity_characteristics/1
  # GET /anatomic_entity_characteristics/1.xml
  def show
    @anatomic_entity_characteristic = AnatomicEntityCharacteristic.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @anatomic_entity_characteristic }
      format.js { render :layout => false }
    end
  end

  # GET /anatomic_entity_characteristics/new
  # GET /anatomic_entity_characteristics/new.xml
  def new
    @anatomic_entity_characteristic = AnatomicEntityCharacteristic.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @anatomic_entity_characteristic }
      format.js { render :layout => false }
    end
  end

  # GET /anatomic_entity_characteristics/1/edit
  def edit
    @anatomic_entity_characteristic = AnatomicEntityCharacteristic.find(params[:id])
  end

  # POST /anatomic_entity_characteristics
  # POST /anatomic_entity_characteristics.xml
  def create
    @anatomic_entity_characteristic = AnatomicEntityCharacteristic.new(params[:anatomic_entity_characteristic])
    respond_to do |format|
      if @anatomic_entity_characteristic.save
        @anatomic_entity_characteristics = AnatomicEntityCharacteristic.all
        flash[:notice] = 'AnatomicEntityCharacteristic was successfully created.'
        format.html { redirect_to(@anatomic_entity_characteristic) }
        format.xml  { render :xml => @anatomic_entity_characteristic, :status => :created, :location => @anatomic_entity_characteristic }
        format.js { render :layout => false }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @anatomic_entity_characteristic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /anatomic_entity_characteristics/1
  # PUT /anatomic_entity_characteristics/1.xml
  def update
    @anatomic_entity_characteristic = AnatomicEntityCharacteristic.find(params[:id])
    respond_to do |format|
      if @anatomic_entity_characteristic.update_attributes(params[:anatomic_entity_characteristic])
        flash[:notice] = 'AnatomicEntityCharacteristic was successfully updated.'
        format.html { redirect_to(@anatomic_entity_characteristic) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @anatomic_entity_characteristic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /anatomic_entity_characteristics/1
  # DELETE /anatomic_entity_characteristics/1.xml
  def destroy
    @anatomic_entity_characteristic = AnatomicEntityCharacteristic.find(params[:id])
    @anatomic_entity_characteristic.destroy
    respond_to do |format|
      format.html { redirect_to(anatomic_entity_characteristics_url) }
      format.xml  { head :ok }
    end
  end
end
