class AllowedTermsController < ApplicationController
  # GET /allowed_terms
  # GET /allowed_terms.xml
  def index
    @allowed_terms = AllowedTerm.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @allowed_terms }
    end
  end

  # GET /allowed_terms/1
  # GET /allowed_terms/1.xml
  def show
    @allowed_term = AllowedTerm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @allowed_term }
    end
  end

  # GET /allowed_terms/new
  # GET /allowed_terms/new.xml
  def new
    @allowed_term = AllowedTerm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @allowed_term }
    end
  end

  # GET /allowed_terms/1/edit
  def edit
    @allowed_term = AllowedTerm.find(params[:id])
  end

  # POST /allowed_terms
  # POST /allowed_terms.xml
  def create
    @allowed_term = AllowedTerm.new(params[:allowed_term])

    respond_to do |format|
      if @allowed_term.save
        flash[:notice] = 'AllowedTerm was successfully created.'
        format.html { redirect_to(@allowed_term) }
        format.xml  { render :xml => @allowed_term, :status => :created, :location => @allowed_term }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @allowed_term.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /allowed_terms/1
  # PUT /allowed_terms/1.xml
  def update
    @allowed_term = AllowedTerm.find(params[:id])

    respond_to do |format|
      if @allowed_term.update_attributes(params[:allowed_term])
        flash[:notice] = 'AllowedTerm was successfully updated.'
        format.html { redirect_to(@allowed_term) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @allowed_term.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /allowed_terms/1
  # DELETE /allowed_terms/1.xml
  def destroy
    @allowed_term = AllowedTerm.find(params[:id])
    @allowed_term.destroy

    respond_to do |format|
      format.html { redirect_to(allowed_terms_url) }
      format.xml  { head :ok }
    end
  end
end
