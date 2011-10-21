class CalculationsController < ApplicationController
  # GET /calculations
  # GET /calculations.xml
  def index
    @calculations = Calculation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @calculations }
    end
  end

  # GET /calculations/1
  # GET /calculations/1.xml
  def show
    @calculation = Calculation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @calculation }
    end
  end

  # GET /calculations/new
  # GET /calculations/new.xml
  def new
    @calculation = Calculation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @calculation }
    end
  end

  # GET /calculations/1/edit
  def edit
    @calculation = Calculation.find(params[:id])
  end

  # POST /calculations
  # POST /calculations.xml
  def create
    @calculation = Calculation.new(params[:calculation])

    respond_to do |format|
      if @calculation.save
        flash[:notice] = 'Calculation was successfully created.'
        format.html { redirect_to(@calculation) }
        format.xml  { render :xml => @calculation, :status => :created, :location => @calculation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @calculation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /calculations/1
  # PUT /calculations/1.xml
  def update
    @calculation = Calculation.find(params[:id])

    respond_to do |format|
      if @calculation.update_attributes(params[:calculation])
        flash[:notice] = 'Calculation was successfully updated.'
        format.html { redirect_to(@calculation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @calculation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /calculations/1
  # DELETE /calculations/1.xml
  def destroy
    @calculation = Calculation.find(params[:id])
    @calculation.destroy

    respond_to do |format|
      format.html { redirect_to(calculations_url) }
      format.xml  { head :ok }
    end
  end
end
