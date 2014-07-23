class ClinicalsectionsController < ApplicationController
  # GET /clinicalsections
  # GET /clinicalsections.json
  def index

    if session[:usertype] != 4
      #redirect_to unauthorized_path
      unauthorized = 1
    end

    @title      =  'Clinical Specialties List'
    @description = 'List of clinical specialties'
    @clinicalsections = Clinicalsection.order(:division_id)

    if unauthorized == 1
        redirect_to unauthorized_path
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @clinicalsections }
      end
    end
    
  end

  # GET /clinicalsections/1
  # GET /clinicalsections/1.json
  def show
    @clinicalsection = Clinicalsection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @clinicalsection }
    end
  end

  # GET /clinicalsections/new
  # GET /clinicalsections/new.json
  def new
    @title      = 'New Clinical Specialty'
    @description = 'Add a new clinical specialty'
    @clinicalsection = Clinicalsection.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @clinicalsection }
    end
  end

  # GET /clinicalsections/1/edit
  def edit
    @title      = 'Edit Clinical Specialty'
    @description = 'Update a clinical specialty'
    @clinicalsection = Clinicalsection.find(params[:id])
  end

  # POST /clinicalsections
  # POST /clinicalsections.json
  def create
    @clinicalsection = Clinicalsection.new(params[:clinicalsection])

    respond_to do |format|
      if @clinicalsection.save
        format.html { redirect_to clinicalsections_path, notice: 'Clinical specialty was successfully created.' }
        format.json { render json: @clinicalsection, status: :created, location: @clinicalsection }
      else
        format.html { render action: "new" }
        format.json { render json: @clinicalsection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clinicalsections/1
  # PUT /clinicalsections/1.json
  def update
    @clinicalsection = Clinicalsection.find(params[:id])

    respond_to do |format|
      if @clinicalsection.update_attributes(params[:clinicalsection])
        format.html { redirect_to clinicalsections_path, notice: 'Clinical specialty was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @clinicalsection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinicalsections/1
  # DELETE /clinicalsections/1.json
  def destroy
    @clinicalsection = Clinicalsection.find(params[:id])
    @clinicalsection.destroy

    respond_to do |format|
      format.html { redirect_to clinicalsections_url }
      format.json { head :no_content }
    end
  end
end
