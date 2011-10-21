class BpOntologiesController < ApplicationController
  # GET /bp_ontologies
  # GET /bp_ontologies.xml
  def index
    @bp_ontologies = BpOntology.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_ontologies }
    end
  end

  # GET /bp_ontologies/1
  # GET /bp_ontologies/1.xml
  def show
    @bp_ontology = BpOntology.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_ontology }
    end
  end

  # GET /bp_ontologies/new
  # GET /bp_ontologies/new.xml
  def new
    @bp_ontology = BpOntology.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_ontology }
    end
  end

  # GET /bp_ontologies/1/edit
  def edit
    @bp_ontology = BpOntology.find(params[:id])
  end

  # POST /bp_ontologies
  # POST /bp_ontologies.xml
  def create
    @bp_ontology = BpOntology.new(params[:bp_ontology])

    respond_to do |format|
      if @bp_ontology.save
        format.html { redirect_to(@bp_ontology, :notice => 'BpOntology was successfully created.') }
        format.xml  { render :xml => @bp_ontology, :status => :created, :location => @bp_ontology }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_ontology.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_ontologies/1
  # PUT /bp_ontologies/1.xml
  def update
    @bp_ontology = BpOntology.find(params[:id])

    respond_to do |format|
      if @bp_ontology.update_attributes(params[:bp_ontology])
        format.html { redirect_to(@bp_ontology, :notice => 'BpOntology was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_ontology.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_ontologies/1
  # DELETE /bp_ontologies/1.xml
  def destroy
    @bp_ontology = BpOntology.find(params[:id])
    @bp_ontology.destroy

    respond_to do |format|
      format.html { redirect_to(bp_ontologies_url) }
      format.xml  { head :ok }
    end
  end
end
