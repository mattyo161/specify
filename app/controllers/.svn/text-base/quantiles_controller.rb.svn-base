class QuantilesController < ApplicationController
  # GET /quantiles
  # GET /quantiles.xml
  def index
    @quantiles = Quantile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @quantiles }
    end
  end

  # GET /quantiles/1
  # GET /quantiles/1.xml
  def show
    @quantile = Quantile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @quantile }
    end
  end

  # GET /quantiles/new
  # GET /quantiles/new.xml
  def new
    @quantile = Quantile.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @quantile }
    end
  end

  # GET /quantiles/1/edit
  def edit
    @quantile = Quantile.find(params[:id])
  end

  # POST /quantiles
  # POST /quantiles.xml
  def create
    @quantile = Quantile.new(params[:quantile])

    respond_to do |format|
      if @quantile.save
        flash[:notice] = 'Quantile was successfully created.'
        format.html { redirect_to(@quantile) }
        format.xml  { render :xml => @quantile, :status => :created, :location => @quantile }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @quantile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /quantiles/1
  # PUT /quantiles/1.xml
  def update
    @quantile = Quantile.find(params[:id])

    respond_to do |format|
      if @quantile.update_attributes(params[:quantile])
        flash[:notice] = 'Quantile was successfully updated.'
        format.html { redirect_to(@quantile) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @quantile.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /quantiles/1
  # DELETE /quantiles/1.xml
  def destroy
    @quantile = Quantile.find(params[:id])
    @quantile.destroy

    respond_to do |format|
      format.html { redirect_to(quantiles_url) }
      format.xml  { head :ok }
    end
  end
end
