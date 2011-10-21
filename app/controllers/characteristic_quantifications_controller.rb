class CharacteristicQuantificationsController < ApplicationController
  # GET /characteristic_quantifications
  # GET /characteristic_quantifications.xml
  def index
    @characteristic_quantifications = CharacteristicQuantification.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @characteristic_quantifications }
    end
  end

  # GET /characteristic_quantifications/1
  # GET /characteristic_quantifications/1.xml
  def show
    @characteristic_quantification = CharacteristicQuantification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @characteristic_quantification }
    end
  end

  # GET /characteristic_quantifications/new
  # GET /characteristic_quantifications/new.xml
  def new
    @characteristic_quantification = CharacteristicQuantification.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @characteristic_quantification }
    end
  end

  # GET /characteristic_quantifications/1/edit
  def edit
    @characteristic_quantification = CharacteristicQuantification.find(params[:id])
  end

  # POST /characteristic_quantifications
  # POST /characteristic_quantifications.xml
  def create
    @characteristic_quantification = CharacteristicQuantification.new(params[:characteristic_quantification])

    respond_to do |format|
      if @characteristic_quantification.save
        flash[:notice] = 'CharacteristicQuantification was successfully created.'
        format.html { redirect_to(@characteristic_quantification) }
        format.xml  { render :xml => @characteristic_quantification, :status => :created, :location => @characteristic_quantification }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @characteristic_quantification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /characteristic_quantifications/1
  # PUT /characteristic_quantifications/1.xml
  def update
    @characteristic_quantification = CharacteristicQuantification.find(params[:id])

    respond_to do |format|
      if @characteristic_quantification.update_attributes(params[:characteristic_quantification])
        flash[:notice] = 'CharacteristicQuantification was successfully updated.'
        format.html { redirect_to(@characteristic_quantification) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @characteristic_quantification.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /characteristic_quantifications/1
  # DELETE /characteristic_quantifications/1.xml
  def destroy
    @characteristic_quantification = CharacteristicQuantification.find(params[:id])
    @characteristic_quantification.destroy

    respond_to do |format|
      format.html { redirect_to(characteristic_quantifications_url) }
      format.xml  { head :ok }
    end
  end

  def update_type
    characteristic_quantification = CharacteristicQuantification.find(params[:id])
    characteristic_quantification.change_type(params[:type])
    @aim_template = AimTemplate.find(params[:template_id])
    respond_to do |format|
	  format.js { render :file => '/main/update_attribute.js.erb' }
      # format.js { render :layout => false }
    end
  end

  def delete_quantifiables
    characteristic_quantification = CharacteristicQuantification.find(params[:id]) if params[:id]
    [characteristic_quantification.send(characteristic_quantification.quantification_type)].flatten.each { |quantifiable| quantifiable.destroy }
    characteristic_quantification.update_attributes(:quantification_type => nil)
    @aim_template = AimTemplate.find(params[:template_id]) if params[:template_id]
    respond_to do |format|
	  format.js { render :file => '/main/update_attribute.js.erb' }
      # format.js { render :layout => false }
    end
  end

end
