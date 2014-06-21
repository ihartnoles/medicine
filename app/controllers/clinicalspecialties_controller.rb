class ClinicalspecialtiesController < ApplicationController
  # GET /clinicalspecialties
  # GET /clinicalspecialties.json
  def index
    @clinicalspecialties = Clinicalspecialty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clinicalspecialties }
    end
  end

  # GET /clinicalspecialties/1
  # GET /clinicalspecialties/1.json
  def show
    @clinicalspecialty = Clinicalspecialty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clinicalspecialty }
    end
  end

  # GET /clinicalspecialties/new
  # GET /clinicalspecialties/new.json
  def new
    @clinicalspecialty = Clinicalspecialty.new
    @title      = 'New clinical Specialty'
    @description = 'Add a new specialty'

    #pull list of specialties
    @specialties = Clinicalsection.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clinicalspecialty }
    end
  end

  # GET /clinicalspecialties/1/edit
  def edit
    @title      = 'Edit clinical Specialty'
    @description = 'Update the clinical specialty'
    @clinicalspecialty = Clinicalspecialty.find(params[:id])


   !@clinicalspecialty.blank? ? @clinicalspecialty_id = Clinicalspecialty.find(params[:id]).speciality_id : @clinicalspecialty_id = 0
   !@clinicalspecialty.blank? ? @basicsciencediscipline_id = Clinicalspecialty.find(params[:id]).basicsciencediscipline_id : @basicsciencediscipline_id = 0
  end

  # POST /clinicalspecialties
  # POST /clinicalspecialties.json
  def create
    @clinicalspecialty = Clinicalspecialty.new
    @clinicalspecialty.affiliate_id = params[:affiliate_id]
    @clinicalspecialty.speciality_id = params[:clinicalspecialty][:speciality_id]
    @clinicalspecialty.year = params[:clinicalspecialty][:year]
    @clinicalspecialty.basicsciencediscipline_id = params[:clinicalspecialty][:basicsciencediscipline_id]
    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @clinicalspecialty.save
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => @clinicalspecialty.affiliate_id, :pidm => @pidm) + "#training", notice: 'clinical Specialty Added!' }
        else
          format.html { redirect_to affiliate_url(:id => @clinicalspecialty.affiliate_id) + "#training", notice: 'clinical Specialty Added!' }
        end
        #format.json { render json: @clinicalspecialty, status: :created, location: @clinicalspecialty }
      else
        format.html { render action: "new" }
        format.json { render json: @clinicalspecialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clinicalspecialties/1
  # PUT /clinicalspecialties/1.json
  def update
    @clinicalspecialty = Clinicalspecialty.find(params[:id])
    @clinicalspecialty.affiliate_id = params[:affiliate_id]
    @clinicalspecialty.speciality_id = params[:clinicalspecialty][:speciality_id]
    @clinicalspecialty.year = params[:clinicalspecialty][:year]
    @clinicalspecialty.basicsciencediscipline_id = params[:clinicalspecialty][:basicsciencediscipline_id]
    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @clinicalspecialty.update_attributes(params[:clinicalspecialty])
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => @clinicalspecialty.affiliate_id, :pidm => @pidm) + "#training", notice: 'clinical Specialty Updated!' }
        else
          format.html { redirect_to affiliate_url(:id => @clinicalspecialty.affiliate_id) + "#training", notice: 'clinical Specialty Updated!' }
        end
        
        #format.json { head :no_content }
      else
        format.html { render action: "edit" }
        #format.json { render json: @clinicalspecialty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinicalspecialties/1
  # DELETE /clinicalspecialties/1.json
  def destroy
    @clinicalspecialty = Clinicalspecialty.find(params[:id])
    @clinicalspecialty.destroy

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @isfacultyflag
        format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#training", notice: 'clinical Specialty Removed!' }
      else
        format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#training", notice: 'clinical Specialty Removed!' }
      end
      
      format.json { head :no_content }
    end
  end
end
