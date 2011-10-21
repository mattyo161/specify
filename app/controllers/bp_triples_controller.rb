class BpTriplesController < ApplicationController
  # GET /bp_triples
  # GET /bp_triples.xml
  def index
    @bp_triples = BpTriple.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_triples }
    end
  end

  # GET /bp_triples/1
  # GET /bp_triples/1.xml
  def show
    @bp_triple = BpTriple.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_triple }
    end
  end

  # GET /bp_triples/new
  # GET /bp_triples/new.xml
  def new
    @bp_triple = BpTriple.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_triple }
    end
  end

  # GET /bp_triples/1/edit
  def edit
    @bp_triple = BpTriple.find(params[:id])
  end

  # POST /bp_triples
  # POST /bp_triples.xml
  def create
    @bp_triple = BpTriple.new(params[:bp_triple])

    respond_to do |format|
      if @bp_triple.save
        format.html { redirect_to(@bp_triple, :notice => 'BpTriple was successfully created.') }
        format.xml  { render :xml => @bp_triple, :status => :created, :location => @bp_triple }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_triple.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_triples/1
  # PUT /bp_triples/1.xml
  def update
    @bp_triple = BpTriple.find(params[:id])

    respond_to do |format|
      if @bp_triple.update_attributes(params[:bp_triple])
        format.html { redirect_to(@bp_triple, :notice => 'BpTriple was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_triple.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_triples/1
  # DELETE /bp_triples/1.xml
  def destroy
    @bp_triple = BpTriple.find(params[:id])
    @bp_triple.destroy

    respond_to do |format|
      format.html { redirect_to(bp_triples_url) }
      format.xml  { head :ok }
    end
  end
end
