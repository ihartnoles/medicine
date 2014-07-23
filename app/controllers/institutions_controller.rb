class InstitutionsController < ApplicationController
  # GET /institutions
  # GET /institutions.json
  def index

    if session[:usertype] != 4
      #redirect_to unauthorized_path
      unauthorized = 1
    end

    @institutions = Institution.all
    @title      = 'Institution List'
    @description = 'List of Institutions'
    if unauthorized == 1
        redirect_to unauthorized_path
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @institutions }
      end
    end
    
  end

  # GET /institutions/1
  # GET /institutions/1.json
  def show
    @institution = Institution.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @institution }
    end
  end

  # GET /institutions/new
  # GET /institutions/new.json
  def new
    @institution = Institution.new
    @title      = 'New Institution'
    @description = 'Add a new institution to the system'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @institution }
    end
  end

  # GET /institutions/1/edit
  def edit
    @institution = Institution.find(params[:id])
    @title      = 'Edit Institution'
    @description = 'Edit an institution option in the system'
  end

  # POST /institutions
  # POST /institutions.json
  def create
    @institution = Institution.new(params[:institution])

    respond_to do |format|
      if @institution.save
        format.html { redirect_to @institution, notice: 'Institution was successfully created.' }
        format.json { render json: @institution, status: :created, location: @institution }
      else
        format.html { render action: "new" }
        format.json { render json: @institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /institutions/1
  # PUT /institutions/1.json
  def update
    @institution = Institution.find(params[:id])

    respond_to do |format|
      if @institution.update_attributes(params[:institution])
        format.html { redirect_to institutions_url, notice: 'Institution was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @institution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /institutions/1
  # DELETE /institutions/1.json
  def destroy
    @institution = Institution.find(params[:id])
    @institution.destroy

    respond_to do |format|
      format.html { redirect_to institutions_url , notice: 'Institution was successfully deleted.'}
      format.json { head :no_content }
    end
  end
end
