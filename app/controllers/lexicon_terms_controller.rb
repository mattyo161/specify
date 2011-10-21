class LexiconTermsController < ApplicationController
  # GET /lexicon_terms
  # GET /lexicon_terms.xml
  # private :root_terms
  def index
    @lexicon_terms = LexiconTerm.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lexicon_terms }
    end
  end

  # GET /lexicon_terms/1
  # GET /lexicon_terms/1.xml
  def show
    @lexicon_term = LexiconTerm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lexicon_term }
    end
  end

  # GET /lexicon_terms/new
  # GET /lexicon_terms/new.xml
  def new
    @lexicon_term = LexiconTerm.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lexicon_term }
    end
  end

  # GET /lexicon_terms/1/edit
  def edit
    @lexicon_term = LexiconTerm.find(params[:id])
  end

  # POST /lexicon_terms
  # POST /lexicon_terms.xml
  def create
    @lexicon_term = LexiconTerm.new(params[:lexicon_term])

    respond_to do |format|
      if @lexicon_term.save
        flash[:notice] = 'LexiconTerm was successfully created.'
        format.html { redirect_to(@lexicon_term) }
        format.xml  { render :xml => @lexicon_term, :status => :created, :location => @lexicon_term }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lexicon_term.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lexicon_terms/1
  # PUT /lexicon_terms/1.xml
  def update
    @lexicon_term = LexiconTerm.find(params[:id])

    respond_to do |format|
      if @lexicon_term.update_attributes(params[:lexicon_term])
        flash[:notice] = 'LexiconTerm was successfully updated.'
        format.html { redirect_to(@lexicon_term) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lexicon_term.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lexicon_terms/1
  # DELETE /lexicon_terms/1.xml
  def destroy
    @lexicon_term = LexiconTerm.find(params[:id])
    @lexicon_term.destroy
    @lexicon_terms = root_terms(params[:lexiconName])
    respond_to do |format|
      format.html { redirect_to(lexicon_terms_url) }
      format.xml  { head :ok }
      format.js { render :file => @lexicon_terms.blank? ? '/lexicon_terms/wipe.js.erb' : '/lexicon_terms/refresh_terms.js.erb' }
    end
  end

  def wipe
    @lexicon_terms = params[:id].blank? ? nil : root_terms(params[:id])
    @lexicon_terms.each { |lt| lt.destroy }
    @lexicon_terms = nil
    respond_to do |format|
      # format.html { render :file => '/main/template_table.html.erb' }
      # format.html { render :text => @aim_template.id } # { render :layout => false }
      format.js # { render :file => '/lexicon_terms/select_lexicon.js.erb' }# { render :text => 'whoops' } # { render :layout => false }
    end
  end

  def select_lexicon
    @lexicon_terms = params[:id].blank? ? nil : root_terms(params[:id])
    # @template = AimTemplate.find(params[:id])
    # @template.id = 123
    respond_to do |format|
      # format.html { render :file => '/main/template_table.html.erb' }
      # format.html { render :text => @aim_template.id } # { render :layout => false }
      format.js # { render :text => 'whoops' } # { render :layout => false }
    end
  end
  
  def search
    arg = params[:query].blank? ? '%' : '%' + params[:query] + '%'
    lexicons = params[:lexicon_list]
    # @lexicon_search_results = LexiconTerm.scoped(:conditions => ['codeValue LIKE ? OR codeVersion LIKE ? OR description LIKE ? OR codingSchemeDesignator LIKE ? OR codeMeaning LIKE ? OR lexiconName LIKE ?', arg, arg, arg, arg, arg, arg])
    @lexicon_search_results = lexicons.blank? ? [] : lexicons.inject([]) { |s, lex| s << LexiconTerm.scoped(:conditions => ['(codeValue LIKE ? OR codingSchemeVersion LIKE ? OR description LIKE ? OR codingSchemeDesignator LIKE ? OR codeMeaning LIKE ?) AND lexiconName LIKE "' + lex + '"', arg, arg, arg, arg, arg]) }.flatten
    @element_id = params[:element_id] #  (params[:panel] == 'lexicon') ? 'lexiconTermSearchTableBody' : 'aimTemplateSearchTableBody'
    respond_to do |format|
      format.js # { render :file =>  }
    end
  end

  def new_lexicon
    lt = LexiconTerm.new(:lexiconName => params[:lexiconName])
    lt.save!
    respond_to do |format| 
      format.js { render :file => '/lexicon_terms/wipe.js.erb' }
    end
  end

  def copy
    lt = LexiconTerm.find(params[:id])
    respond_to do |format|
      if copy_lexicon_term(lt)
        @lexicon_terms = root_terms(lt.lexiconName)
        format.html { redirect_to('/') }
        # format.html render :update do |page|; page.replace_html('templateContainerList', :file => '/main/template_group_list.html.erb') ; end  # :partial => '', :collection => @users }
        format.xml { render :xml => @aim_template, :status => :created, :location => @aim_template }
        format.js { render :file => '/lexicon_terms/refresh_terms.js.erb' } # render :mime_type => Mime::Type.lookup("application/javascript")
      end
    end
  end
end
