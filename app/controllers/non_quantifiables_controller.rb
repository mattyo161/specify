class NonQuantifiablesController < ApplicationController
  # GET /non_quantifiables
  # GET /non_quantifiables.xml
  def index
    @non_quantifiables = NonQuantifiable.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @non_quantifiables }
    end
  end

  # GET /non_quantifiables/1
  # GET /non_quantifiables/1.xml
  def show
    @non_quantifiable = NonQuantifiable.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @non_quantifiable }
    end
  end

  # GET /non_quantifiables/new
  # GET /non_quantifiables/new.xml
  def new
    @non_quantifiable = NonQuantifiable.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @non_quantifiable }
    end
  end

  # GET /non_quantifiables/1/edit
  def edit
    @non_quantifiable = NonQuantifiable.find(params[:id])
  end

  # POST /non_quantifiables
  # POST /non_quantifiables.xml
  def create
    @non_quantifiable = NonQuantifiable.new(params[:non_quantifiable])

    respond_to do |format|
      if @non_quantifiable.save
        flash[:notice] = 'NonQuantifiable was successfully created.'
        format.html { redirect_to(@non_quantifiable) }
        format.xml  { render :xml => @non_quantifiable, :status => :created, :location => @non_quantifiable }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @non_quantifiable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /non_quantifiables/1
  # PUT /non_quantifiables/1.xml
  def update
    @non_quantifiable = NonQuantifiable.find(params[:id])

    respond_to do |format|
      if @non_quantifiable.update_attributes(params[:non_quantifiable])
        flash[:notice] = 'NonQuantifiable was successfully updated.'
        format.html { redirect_to(@non_quantifiable) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @non_quantifiable.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /non_quantifiables/1
  # DELETE /non_quantifiables/1.xml
  def destroy
    @non_quantifiable = NonQuantifiable.find(params[:id])
    @non_quantifiable.destroy

    respond_to do |format|
      format.html { redirect_to(non_quantifiables_url) }
      format.xml  { head :ok }
    end
  end

end
