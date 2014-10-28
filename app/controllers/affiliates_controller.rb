class AffiliatesController < ApplicationController
  # GET /affiliates
  # GET /affiliates.json
  def index
    
    currentuser = User.find(session[:userid])

    if params[:prospect]
      @title      =  'Affiliate Candidate List'
      @description = 'List of Affiliate Candidates'
      if session[:usertype] == 4
         #user is an admin; let them see whatever they want
        @affiliates = Affiliate.where(:isfaculty => 0)
      else
         #you're not an admin; need to check useraccesslevel
        if !currentuser.getPowerUserAccess(session[:userid]).blank?
            @affiliates = Affiliate.find(:all, :conditions => ["isfaculty = ? AND faculty_classification_id IN (?)", 0, Useraccesslevel.where(:affiliate_id => session[:userid]).pluck(:facultyclassification_id)])
        else
            unauthorized = 1
        end
      end
    else 
      
      
      

      if !params[:faculty_classification_id].blank?
        @title       =  FacultyClassification.find(params[:faculty_classification_id]).classification + ' List'
        @description = FacultyClassification.find(params[:faculty_classification_id]).classification
      else
        @title       =  'Faculty/Staff List'
        @description = 'List of CoM Faculty/Staff'
      end 
      
        if session[:usertype] == 4
           #user is an admin; let them see whatever they want
           if params[:faculty_classification_id]
                @affiliates = Affiliate.where(:isfaculty => 1, :faculty_classification_id => params[:faculty_classification_id])
           else
                @affiliates = Affiliate.where(:isfaculty => 1)                 
           end
        else
          #you're not an admin; need to check useraccesslevel
          if !currentuser.hasAccess(session[:userid], params[:faculty_classification_id]).blank?
            @affiliates = Affiliate.where(:isfaculty => 1, :faculty_classification_id => params[:faculty_classification_id])
          else
            unauthorized = 1
          end
        end
   
    end

    if unauthorized == 1
      redirect_to unauthorized_path
    else
      respond_to do |format|
          format.html # index.html.erb
          format.json { render json: @affiliates }
          format.xls  { response.headers['Content-Disposition'] = 'attachment; filename="affiliates_' +  Time.now.to_s + '.xls"' } 
      end
    end
  end

  # GET /affiliates/1
  # GET /affiliates/1.json
  def show

    @id = !params[:affiliate_id].blank? ? params[:affiliate_id] : params[:id]
    thisaffiliate = Affiliate.find(@id)
    @affiliate = Affiliate.find(@id)
    @isfacultyflag = Affiliate.find(@id).isfaculty

   #if !thisaffiliate.firstname.blank? && !thisaffiliate.lastname.blank? && !thisaffiliate.suffix.blank?
    #@fullname  = thisaffiliate.firstname  + ' ' + thisaffiliate.lastname +  ', ' + thisaffiliate.suffix
   #elsif !thisaffiliate.firstname.blank? && !thisaffiliate.lastname.blank? && !thisaffiliate.suffix.blank
    @fullname  = thisaffiliate.firstname  + ' ' + thisaffiliate.lastname  
   #else
    #@fullname  = ''
   #end 
   
    if @isfacultyflag
      @title      = 'Edit Faculty - '  +  @fullname  
      @description = 'Edit faculty details'
      @isfacultyflag    = 1
      @banner =  Banner.find_by_id(params[:pidm])
    else 
      @title      = 'Edit Affiliate Candidate - ' +  @fullname
      @description = 'Edit affiliate candidate details'
      @isfacultyflag    = 0
    end 
    
    @hospitalprivilege = Hospitalprivilege.new
    @showprivileges = Hospitalprivilege.where(:affiliate_id => params[:id])

    @closesthospitalprivilege = Closesthospitalprivilege.new
    @showclosestprivileges = Closesthospitalprivilege.where(:affiliate_id => params[:id])

    @showlanguagespoken = Affiliatelanguage.where(:affiliate_id => params[:id])
    #@languagespoken_id = Affiliatelanguage.where(:affiliate_id => params[:id], :language_id => ?)
    @languagespoken = Affiliatelanguage.new   
    @languagelist   = Language.all

    @affiliateresearcharea = Affiliateresearcharea.where(:affiliate_id => params[:id])
    @clinicalspecialties  = Clinicalspecialty.where(:affiliate_id => params[:id])
    @degrees               = Degree.where(:affiliate_id => params[:id])

    @annualevaluations     = Annualevaluation.where(:affiliate_id => params[:id])
    @appointmentrejections = Appointmentrejection.where(:affiliate_id => params[:id])


    #felloship data
    @fellowships           = Fellowship.where(:affiliate_id => params[:id]) 
    #residency data
    @residencies           = Residency.where(:affiliate_id => params[:id]) 

    #disciplinary data
    @disciplinaryactions     = Disciplinaryaction.where(:affiliate_id => params[:id])
    
    #CAP Dates
    @cap_dates     = CapDate.where(:affiliate_id => params[:id])

    #Faculty Overload Dates
    @faculty_dates  = FacultyDate.where(:affiliate_id => params[:id])

    #COM Dates
    @com_dates_appts = ComDatesAppt.where(:affiliate_id => params[:id])

    #Contract Dates
    @contract_dates     = ContractDate.where(:affiliate_id => params[:id])

    #Appointment Dates
    @appointment_dates  = AppointmentDate.where(:affiliate_id => params[:id])

    #Assignments
    @assignments = Assignment.where(:affiliate_id => params[:id])

    #Licenses
    @licenses = License.where(:affiliate_id => params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiliate }
    end
  end

  # GET /affiliates/new
  # GET /affiliates/new.json
  def new
    if params[:prospect]
      @title       = 'New Affiliate Candidate' 
      @description = 'Add a new affiliate candidate'
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
      @description = 'Edit faculty'
      @isfacultyflag    = 1
    else 
      @title      = 'Edit Affiliate Candidate'
      @description = 'Edit Affiliate Candidate'
      @isfacultyflag    = 0
    end 
  end

  # POST /affiliates
  # POST /affiliates.json
  def create
    @affiliate = Affiliate.new(params[:affiliate])
    #default isfaculty = 0; assumption is affiliate candidate was entered first
    @affiliate.isfaculty = 0

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
      @pidm = Affiliate.find(params[:id]).pidm
    else 
      @title      = 'Edit Affiliate Candidate'
      @description = 'Edit Affiliate Candidate'
      @type        = 'Affilate Candidate'
    end 

    respond_to do |format|
      if @affiliate.update_attributes(params[:affiliate])
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:id], :pidm => @pidm) , notice: 'clinical Specialty Updated!' }
        else
          format.html { redirect_to @affiliate, notice: @type + ' information successfully updated.' }
        end
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
    @isfacultyflag = Affiliate.find(params[:id]).isfaculty
    @affiliate.destroy

     if @isfacultyflag
      @type        = 'Faculty'
      @pidm = Affiliate.find(params[:id]).pidm

      respond_to do |format|
        #format.html { redirect_to affiliates_url }
        #format.html { redirect_to affiliates_path, notice: @type + ' information successfully deleted.' }
        format.json { head :no_content }
      end

    else 
      @type        = 'Affilate Candidate'

      respond_to do |format|
        #format.html { redirect_to affiliates_url }
        format.html { redirect_to affiliates_path(:prospect => "1"), notice: @type + ' information successfully deleted.' }
        format.json { head :no_content }
      end
    end 

    
  end

  #GET /search
  def search
    @title       = 'Advanced Search'
    @description = 'Advanced Search'

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

    @title      = 'Advanced Search Results'

    #results = Affiliate.joins("LEFT OUTER JOIN clinicalspecialties ON affiliates.id = clinicalspecialties.affiliate_id").order(:lastname)

    results = Affiliate.joins("LEFT OUTER JOIN assignments ON affiliates.id = assignments.affiliate_id LEFT OUTER JOIN cap_dates ON affiliates.id = cap_dates.affiliate_id").order(:lastname)

    results = results.where("firstname LIKE ?", params[:searchform][:firstname]) if params[:searchform][:firstname].present?
    results = results.where("lastname LIKE ?", params[:searchform][:lastname]) if params[:searchform][:lastname].present?
    results = results.where("cellphone LIKE ?", params[:searchform][:cellphone]) if params[:searchform][:cellphone].present?
    results = results.where("emailfau LIKE ?", params[:searchform][:emailfau]) if params[:searchform][:emailfau].present?
    results = results.where("clinicalsection_id = ?", params[:searchform][:section_id]) if params[:searchform][:section_id].present?
    results = results.where("clinicaldivision_id = ?", params[:searchform][:division_id]) if params[:searchform][:division_id].present?
    results = results.where("meetingdate = ?", params[:searchform][:meetingdate]) if params[:searchform][:meetingdate].present?
    results = results.where("certificatedate = ?", params[:searchform][:certificatedate]) if params[:searchform][:certificatedate].present?

    @affiliates = results

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

    isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end


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
      if isfacultyflag
        format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#training", notice: 'Training Updated!' }
      else
        format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#training" , notice: 'Training Updated!'}
      end
      #format.json { head :ok }
    end
   

  end

  def testxml
    @affiliates = Affiliate.find(:all, :conditions => ["isfaculty = ?", 1])

    respond_to do |format|
      #format.html # index.html.erb
      format.xml # index.xml.builder
    end
  end

end
