class HospitalsController < ApplicationController
  # GET /hospitals
  # GET /hospitals.json
  def index

    if session[:usertype] != 4
      #redirect_to unauthorized_path
      unauthorized = 1
    end


    @hospitals = Hospital.all
    @title      = 'Hospital List'
    @description = 'List of Hospitals'

    if unauthorized == 1
        redirect_to unauthorized_path
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @hospitals }
      end
    end
    
  end

  # GET /hospitals/1
  # GET /hospitals/1.json
  def show
    @hospital = Hospital.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hospital }
    end
  end

  # GET /hospitals/new
  # GET /hospitals/new.json
  def new
    @hospital = Hospital.new
    @title      = 'New Hospital'
    @description = 'Add a new hospital to the system'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hospital }
    end
  end

  # GET /hospitals/1/edit
  def edit
    @hospital = Hospital.find(params[:id])
    @title      = 'Edit Hospital'
    @description = 'Edit a hospital option in the system'
  end

  # POST /hospitals
  # POST /hospitals.json
  def create
    @hospital = Hospital.new(params[:hospital])
    

    respond_to do |format|
      if @hospital.save
        format.html { redirect_to hospitals_path, notice: 'Hospital was successfully created.' }
        format.json { render json: @hospital, status: :created, location: @hospital }
      else
        format.html { render action: "new" }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hospitals/1
  # PUT /hospitals/1.json
  def update
    @hospital = Hospital.find(params[:id])

    respond_to do |format|
      if @hospital.update_attributes(params[:hospital])
        format.html { redirect_to @hospital, notice: 'Hospital was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitals/1
  # DELETE /hospitals/1.json
  def destroy
    @hospital = Hospital.find(params[:id])
    @hospital.destroy

    respond_to do |format|
      format.html { redirect_to hospitals_url, notice: 'Hospital was successfully deleted.'  }
      format.json { head :no_content }
    end
  end
end
