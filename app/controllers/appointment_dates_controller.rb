class AppointmentDatesController < ApplicationController
  # GET /appointment_dates
  # GET /appointment_dates.json
  def index
    @appointment_dates = AppointmentDate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointment_dates }
    end
  end

  # GET /appointment_dates/1
  # GET /appointment_dates/1.json
  def show
    @appointment_date = AppointmentDate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment_date }
    end
  end

  # GET /appointment_dates/new
  # GET /appointment_dates/new.json
  def new
    @appointment_date = AppointmentDate.new
    @title      = 'New Appointment Date'
    @description = 'Add a new Appointment date'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment_date }
    end
  end

  # GET /appointment_dates/1/edit
  def edit
    @title      = 'Edit Appoointment Date'
    @description = 'Edit existing appointment date'
    @appointment_date = AppointmentDate.find(params[:id])
  end

  # POST /appointment_dates
  # POST /appointment_dates.json
  def create
    @appointment_date = AppointmentDate.new(params[:appointment_date])
    @appointment_date.affiliate_id = params[:affiliate_id]

    respond_to do |format|
      if @appointment_date.save
        format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#appointments", notice: 'Appointment Date Added!'}
        format.json { render json: @appointment_date, status: :created, location: @appointment_date }
      else
        format.html { render action: "new" }
        format.json { render json: @appointment_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appointment_dates/1
  # PUT /appointment_dates/1.json
  def update
    @appointment_date = AppointmentDate.find(params[:id])
    
    respond_to do |format|
      if @appointment_date.update_attributes(params[:appointment_date])
        format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#appointments", notice: 'Appointment Date Updated!'}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointment_dates/1
  # DELETE /appointment_dates/1.json
  def destroy
    @appointment_date = AppointmentDate.find(params[:id])
    @appointment_date.destroy

    respond_to do |format|
      format.html { redirect_to appointment_dates_url }
      format.json { head :no_content }
    end
  end
end
