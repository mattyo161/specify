class NumericalsController < ApplicationController
  # GET /numericals
  # GET /numericals.xml
  def index
    @numericals = Numerical.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @numericals }
    end
  end

  # GET /numericals/1
  # GET /numericals/1.xml
  def show
    @numerical = Numerical.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @numerical }
    end
  end

  # GET /numericals/new
  # GET /numericals/new.xml
  def new
    @numerical = Numerical.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @numerical }
    end
  end

  # GET /numericals/1/edit
  def edit
    @numerical = Numerical.find(params[:id])
  end

  # POST /numericals
  # POST /numericals.xml
  def create
    @numerical = Numerical.new(params[:numerical])

    respond_to do |format|
      if @numerical.save
        flash[:notice] = 'Numerical was successfully created.'
        format.html { redirect_to(@numerical) }
        format.xml  { render :xml => @numerical, :status => :created, :location => @numerical }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @numerical.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /numericals/1
  # PUT /numericals/1.xml
  def update
    @numerical = Numerical.find(params[:id])

    respond_to do |format|
      if @numerical.update_attributes(params[:numerical])
        flash[:notice] = 'Numerical was successfully updated.'
        format.html { redirect_to(@numerical) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @numerical.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /numericals/1
  # DELETE /numericals/1.xml
  def destroy
    @numerical = Numerical.find(params[:id])
    @numerical.destroy

    respond_to do |format|
      format.html { redirect_to(numericals_url) }
      format.xml  { head :ok }
    end
  end
end
