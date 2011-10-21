class BpTermsController < ApplicationController
  # GET /bp_terms
  # GET /bp_terms.xml
  def index
    @bp_terms = BpTerm.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bp_terms }
    end
  end

  # GET /bp_terms/1
  # GET /bp_terms/1.xml
  def show
    @bp_term = BpTerm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bp_term }
    end
  end

  # GET /bp_terms/new
  # GET /bp_terms/new.xml
  def new
    @bp_term = BpTerm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bp_term }
    end
  end

  # GET /bp_terms/1/edit
  def edit
    @bp_term = BpTerm.find(params[:id])
  end

  # POST /bp_terms
  # POST /bp_terms.xml
  def create
    @bp_term = BpTerm.new(params[:bp_term])

    respond_to do |format|
      if @bp_term.save
        format.html { redirect_to(@bp_term, :notice => 'BpTerm was successfully created.') }
        format.xml  { render :xml => @bp_term, :status => :created, :location => @bp_term }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bp_term.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bp_terms/1
  # PUT /bp_terms/1.xml
  def update
    @bp_term = BpTerm.find(params[:id])

    respond_to do |format|
      if @bp_term.update_attributes(params[:bp_term])
        format.html { redirect_to(@bp_term, :notice => 'BpTerm was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bp_term.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bp_terms/1
  # DELETE /bp_terms/1.xml
  def destroy
    @bp_term = BpTerm.find(params[:id])
    @bp_term.destroy

    respond_to do |format|
      format.html { redirect_to(bp_terms_url) }
      format.xml  { head :ok }
    end
  end
end
