class AffiliatesController < ApplicationController
  # GET /affiliates
  # GET /affiliates.json
  def index
    
    if params[:prospect]
      @title      =  'Prospect List'
      @description = 'List of Prospects'
      @affiliates = Affiliate.where(:isfaculty => 0)
    else 
      @title      =  'Faculty List'
      @description = 'List of CoM Faculty'
      @affiliates = Affiliate.where(:isfaculty => 1)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @affiliates }
      format.xls  { response.headers['Content-Disposition'] = 'attachment; filename="affiliates_' +  Time.now.to_s + '.xls"' } 
    end
  end

  # GET /affiliates/1
  # GET /affiliates/1.json
  def show

    @id = !params[:affiliate_id].blank? ? params[:affiliate_id] : params[:id]
    @affiliate = Affiliate.find(@id)
    @isfacultyflag = Affiliate.find(@id).isfaculty
   
    if @isfacultyflag
      @title      = 'Edit Faculty'
      @description = 'Edit faculty details'
      @isfacultyflag    = 1
    else 
      @title      = 'Edit Prospect'
      @description = 'Edit prospect details'
      @isfacultyflag    = 0
    end 
    
    @hospitalprivilege = Hospitalprivilege.new
    @showprivileges = Hospitalprivilege.where(:affiliate_id => params[:id])
    @showlanguagespoken = Affiliatelanguage.where(:affiliate_id => params[:id])
    #@languagespoken_id = Affiliatelanguage.where(:affiliate_id => params[:id], :language_id => ?)
    @languagespoken = Affiliatelanguage.new   
    @languagelist   = Language.all

    @affiliateresearcharea = Affiliateresearcharea.where(:affiliate_id => params[:id])
    @certifiedspecialties  = Certifiedspeciality.where(:affiliate_id => params[:id])
    @degrees               = Degree.where(:affiliate_id => params[:id])
    @annualevaluations     = Annualevaluation.where(:affiliate_id => params[:id])

    #felloship data
    @fellowships           = Fellowship.where(:affiliate_id => params[:id]) 
    
    #residency data
    @residencies           = Residency.where(:affiliate_id => params[:id]) 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiliate }
    end
  end

  # GET /affiliates/new
  # GET /affiliates/new.json
  def new
    if params[:prospect]
      @title       = 'New Prospect' 
      @description = 'Add a new prospect'
      @isfacultyflag    = 0
      #set session var for prospect
      #session[:isProspect] = 1
    else 
      @title       = 'New Faculty'
      @description = 'Add a new Faculty member'
      @isfacultyflag    = 1
      #session[:isProspect] = 0
    end

    @affiliate = Affiliate.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @affiliate }
    end
  end

  # GET /affiliates/1/edit
  def edit
    @affiliate = Affiliate.find(params[:id])
    @isfacultyflag = Affiliate.find(params[:id]).isfaculty

    if @isfacultyflag
      @title      = 'Edit Faculty'
      @description = 'Edit faculty x'
      @isfacultyflag    = 1
    else 
      @title      = 'Edit Prospect'
      @description = 'Edit prospect'
      @isfacultyflag    = 0
    end 
  end

  # POST /affiliates
  # POST /affiliates.json
  def create
    @affiliate = Affiliate.new(params[:affiliate])

    respond_to do |format|
      if @affiliate.save
        format.html { redirect_to @affiliate, notice: 'Success! New record created.' }
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
    @isfacultyflag = Affiliate.find(params[:id]).isfaculty

    if @isfacultyflag
      @title      = 'Edit Faculty'
      @description = 'Edit faculty'
      @type        = 'Faculty'
    else 
      @title      = 'Edit Prospect'
      @description = 'Edit prospect'
      @type        = 'Prospect'
    end 

    respond_to do |format|
      if @affiliate.update_attributes(params[:affiliate])
        format.html { redirect_to @affiliate, notice: @type + ' information successfully updated.' }
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
    @description = 'Advanced Search of Faculty'

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
    @affiliateresearcharea = Affiliateresearcharea.where(:affiliate_id => params[:id])

   !@affiliateresearcharea.blank? ? @research_id = Researcharea.where(["id = ?" , Affiliateresearcharea.where(:affiliate_id => params[:id]).pluck(:researcharea_id)]).select("id").first.id : @research_id = 0
   !@affiliateresearcharea.blank? ? @researchdescription = Affiliateresearcharea.where(:affiliate_id => params[:id]).select("researchdescription").first.researchdescription : @researchdescription = ''
  end

  def saveTraining
    #save affiliate medical license
    affiliate = Affiliate.find(params[:affiliate_id])
    affiliate.license = params[:license]
    affiliate.save

    #upload the CV (TO DO)


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
   
    respond_to do |format|
      format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#training" , notice: 'Training Updated!'}
      #format.json { head :ok }
    end
   

  end


end
