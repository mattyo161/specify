class InferencesController < ApplicationController
  # GET /inferences
  # GET /inferences.xml
  def index
    @inferences = Inference.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @inferences }
    end
  end

  # GET /inferences/1
  # GET /inferences/1.xml
  def show
    @inference = Inference.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @inference }
    end
  end

  # GET /inferences/new
  # GET /inferences/new.xml
  def new
    @inference = Inference.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @inference }
    end
  end

  # GET /inferences/1/edit
  def edit
    @inference = Inference.find(params[:id])
  end

  # POST /inferences
  # POST /inferences.xml
  def create
    @inference = Inference.new(params[:inference])

    respond_to do |format|
      if @inference.save
        flash[:notice] = 'Inference was successfully created.'
        format.html { redirect_to(@inference) }
        format.xml  { render :xml => @inference, :status => :created, :location => @inference }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @inference.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /inferences/1
  # PUT /inferences/1.xml
  def update
    @inference = Inference.find(params[:id])

    respond_to do |format|
      if @inference.update_attributes(params[:inference])
        flash[:notice] = 'Inference was successfully updated.'
        format.html { redirect_to(@inference) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @inference.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /inferences/1
  # DELETE /inferences/1.xml
  def destroy
    @inference = Inference.find(params[:id])
    @inference.destroy

    respond_to do |format|
      format.html { redirect_to(inferences_url) }
      format.xml  { head :ok }
    end
  end
end
