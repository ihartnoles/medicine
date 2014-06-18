class AppointmentrejectionsController < ApplicationController
  # GET /appointmentrejections
  # GET /appointmentrejections.json
  def index
    @appointmentrejections = Appointmentrejection.all
    @title      =  'Appointment Rejections'
    @description = 'List of Appointment Rejections'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointmentrejections }
    end
  end

  # GET /appointmentrejections/1
  # GET /appointmentrejections/1.json
  def show
    @appointmentrejection = Appointmentrejection.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointmentrejection }
    end
  end

  # GET /appointmentrejections/new
  # GET /appointmentrejections/new.json
  def new    
    @appointmentrejection = Appointmentrejection.new
    @title       = 'New Appointment Rejection'
    @description = 'Add a new Appointment Rejection'
    @affiliate_id = params[:affiliate_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointmentrejection }
    end
  end

  # GET /appointmentrejections/1/edit
  def edit
    @title      = 'Edit Appointment Rejection'
    @description = 'Edit existing Appointment Rejection'
    @appointmentrejection = Appointmentrejection.find(params[:id])
  end

  # POST /appointmentrejections
  # POST /appointmentrejections.json
  def create
    @appointmentrejection = Appointmentrejection.new(params[:appointmentrejection])
    @affiliate_id = params[:appointmentrejection][:affiliate_id]

    respond_to do |format|
      if @appointmentrejection.save
        #format.html { redirect_to @appointmentrejection, notice: 'Appointmentrejection was successfully created.' }
        format.html { redirect_to affiliate_url(:id => params[:appointmentrejection][:affiliate_id]) + "#assignments", notice: 'Appointment Rejection Added!'}
        format.json { render json: @appointmentrejection, status: :created, location: @appointmentrejection }
      else
        format.html { render action: "new" }
        #format.json { render json: @appointmentrejection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appointmentrejections/1
  # PUT /appointmentrejections/1.json
  def update
    @appointmentrejection = Appointmentrejection.find(params[:id])

    respond_to do |format|
      if @appointmentrejection.update_attributes(params[:appointmentrejection])
        format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#assignments", notice: 'Appointment Rejection Updated!'}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointmentrejection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointmentrejections/1
  # DELETE /appointmentrejections/1.json
  def destroy
    @appointmentrejection = Appointmentrejection.find(params[:id])
    @appointmentrejection.destroy

    respond_to do |format|
      format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#assignments", notice: 'Appointment Rejection Removed!' }
      format.json { head :no_content }
    end
  end
end
