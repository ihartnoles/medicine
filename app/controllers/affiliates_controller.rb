class AffiliatesController < ApplicationController
  # GET /affiliates
  # GET /affiliates.json
  def index
    @affiliates = Affiliate.all
    @title      = 'Affiliate List'
    @description = 'List of CoM Affiliates'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @affiliates }
      format.xls  { response.headers['Content-Disposition'] = 'attachment; filename="affiliates_' +  Time.now.to_s + '.xls"' } 
    end
  end

  # GET /affiliates/1
  # GET /affiliates/1.json
  def show

    @title      = 'Edit Affiliate'
    @description = 'Change affiliate details'

    @affiliate = Affiliate.find(params[:id])
    @hospitalprivilege = Hospitalprivilege.new
    @showprivileges = Hospitalprivilege.where(:affiliate_id => params[:id])
    @showlanguagespoken = Affiliatelanguage.where(:affiliate_id => params[:id])
    #@languagespoken_id = Affiliatelanguage.where(:affiliate_id => params[:id], :language_id => ?)
    @languagespoken = Affiliatelanguage.new   
    @languagelist = Language.all

    @affiliateresearcharea = Affiliateresearcharea.where(:affiliate_id => params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiliate }
    end
  end

  # GET /affiliates/new
  # GET /affiliates/new.json
  def new
    @affiliate = Affiliate.new
    @title      = 'New Affiliate'
    @description = 'Add a new affiliate'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @affiliate }
    end
  end

  # GET /affiliates/1/edit
  def edit
    @affiliate = Affiliate.find(params[:id])
     @title      = 'Edit Affiliate'
    @description = 'Edit an affiliate'
  end

  # POST /affiliates
  # POST /affiliates.json
  def create
    @affiliate = Affiliate.new(params[:affiliate])

    respond_to do |format|
      if @affiliate.save
        format.html { redirect_to @affiliate, notice: 'Affiliate was successfully created.' }
        format.json { render json: @affiliate, status: :created, location: @affiliate }
      else
        format.html { render action: "new" }
        format.json { render json: @affiliate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /affiliates/1
  # PUT /affiliates/1.json
  def update
    @affiliate = Affiliate.find(params[:id])

    respond_to do |format|
      if @affiliate.update_attributes(params[:affiliate])
        format.html { redirect_to @affiliate, notice: 'Affiliate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @affiliate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliates/1
  # DELETE /affiliates/1.json
  def destroy
    @affiliate = Affiliate.find(params[:id])
    @affiliate.destroy

    respond_to do |format|
      format.html { redirect_to affiliates_url }
      format.json { head :no_content }
    end
  end

  #GET /search
  def search
    @title       = 'Advanced Search'
    @description = 'Advanced Search of Affiliates/Faculty'

    @clinicalsection = Clinicalsection.new
    @sections = Clinicalsection.all

    respond_to do |format|
      format.html # search.html.erb
      format.json { render json: @affiliates }
    end
  end

  #handles jquery/ajax call to populate second-drop down on search page.
  def update_section_select
    @sections = Clinicalsection.where(:division_id=>params[:id]).order(:sectionname) unless params[:id].blank?
    render :partial => "sections"
  end


  # POST /affiliates
  # POST /affiliates.json
  def doSearch
    #@affiliate = Affiliate.new(params[:affiliate])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiliate }
    end
  end

  def editTraining
    @title      = 'Edit Training'
    @affiliate  = Affiliate.find(params[:id])   

  end

  def saveTraining
    #save affiliate medical license
    affiliate = Affiliate.find(params[:affiliate_id])
    affiliate.license = params[:license]
    affiliate.save

    #upload the CV

    #clear out any existing affiliate research
    existingresearcharea = Affiliateresearcharea.where(:affiliate_id => params[:affiliate_id])
    
    if existingresearcharea
      delete = Affiliateresearcharea.destroy_all(:affiliate_id => params[:affiliate_id])
    end 

    #save the affiliate research area and research description
    affiliateResearchArea = Affiliateresearcharea.new
    affiliateResearchArea.affiliate_id = params[:affiliate_id]
    affiliateResearchArea.researcharea_id = params[:researcharea][:id]
    affiliateResearchArea.researchdescription = params[:researchdescription]
    affiliateResearchArea.save

  end


end
