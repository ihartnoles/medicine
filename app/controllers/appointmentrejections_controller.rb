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
    @affiliate_id = params[:affiliate_id]
  end

  # POST /appointmentrejections
  # POST /appointmentrejections.json
  def create
    @appointmentrejection = Appointmentrejection.new(params[:appointmentrejection])
    @affiliate_id = params[:appointmentrejection][:affiliate_id]

    @isfacultyflag = Affiliate.find(params[:appointmentrejection][:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:appointmentrejection][:affiliate_id]).pidm
    end

    respond_to do |format|
      if @appointmentrejection.save
       
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:appointmentrejection][:affiliate_id], :pidm => @pidm) + "#assignments", notice: 'Appointment Rejection Added!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:appointmentrejection][:affiliate_id])+ "#assignments", notice: 'Appointment Rejection Added!' }
        end

        # format.html { redirect_to affiliate_url(:id => params[:appointmentrejection][:affiliate_id]) + "#assignments", notice: 'Appointment Rejection Added!'}
        # format.json { render json: @appointmentrejection, status: :created, location: @appointmentrejection }
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

    @isfacultyflag = Affiliate.find(params[:appointmentrejection][:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:appointmentrejection][:affiliate_id]).pidm
    end


    respond_to do |format|
      if @appointmentrejection.update_attributes(params[:appointmentrejection])
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:appointmentrejection][:affiliate_id], :pidm => @pidm) + "#assignments", notice: 'Appointment Rejection Updated!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:appointmentrejection][:affiliate_id])+ "#assignments", notice: 'Appointment Rejection Updated!' }
        end
        # format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#assignments", notice: 'Appointment Rejection Updated!'}
        # format.json { head :no_content }
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

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#assignments", notice: 'Appointment Rejection Removed!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#assignments", notice: 'Appointment Rejection Removed!' }
        end
      # format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#assignments", notice: 'Appointment Rejection Removed!' }
      # format.json { head :no_content }
    end
  end
end
