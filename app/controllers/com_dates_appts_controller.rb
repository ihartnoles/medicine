class ComDatesApptsController < ApplicationController
  # GET /com_dates_appts
  # GET /com_dates_appts.json
  def index
    @com_dates_appts = ComDatesAppt.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @com_dates_appts }
    end
  end

  # GET /com_dates_appts/1
  # GET /com_dates_appts/1.json
  def show
    @com_dates_appt = ComDatesAppt.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @com_dates_appt }
    end
  end

  # GET /com_dates_appts/new
  # GET /com_dates_appts/new.json
  def new
    @com_dates_appt = ComDatesAppt.new
    @title      = 'New COM Date/Appointment'
    @description = 'Add a new COM date/appointment'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @com_dates_appt }
    end
  end

  # GET /com_dates_appts/1/edit
  def edit
    @com_dates_appt = ComDatesAppt.find(params[:id])
    @title      = 'Edit COM Date/Appointment'
    @description = 'Edit a COM date/appointment'

  # POST /com_dates_appts
  # POST /com_dates_appts.json 
  end

  def create
    @com_dates_appt = ComDatesAppt.new(params[:com_dates_appt])

    @isfacultyflag = Affiliate.find(params[:com_dates_appt][:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:com_dates_appt][:affiliate_id]).pidm
    end

    respond_to do |format|
      if @com_dates_appt.save
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:com_dates_appt][:affiliate_id], :pidm => @pidm) + "#appointments", notice: 'Date Added!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:com_dates_appt][:affiliate_id])+ "#appointments", notice: 'Date Added!' }
        end

        #format.html { redirect_to @com_dates_appt, notice: 'Com dates appt was successfully created.' }
        #format.json { render json: @com_dates_appt, status: :created, location: @com_dates_appt }
      else
        format.html { render action: "new" }
        format.json { render json: @com_dates_appt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /com_dates_appts/1
  # PUT /com_dates_appts/1.json
  def update
    @com_dates_appt = ComDatesAppt.find(params[:id])

    @isfacultyflag = Affiliate.find(params[:com_dates_appt][:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:com_dates_appt][:affiliate_id]).pidm
    end

    respond_to do |format|
      if @com_dates_appt.update_attributes(params[:com_dates_appt])
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:com_dates_appt][:affiliate_id], :pidm => @pidm) + "#appointments", notice: 'Date Updated!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:com_dates_appt][:affiliate_id])+ "#appointments", notice: 'Date Updateed!' }
        end
        
      else
        format.html { render action: "edit" }
        format.json { render json: @com_dates_appt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /com_dates_appts/1
  # DELETE /com_dates_appts/1.json
  def destroy
    @com_dates_appt = ComDatesAppt.find(params[:id])
    @com_dates_appt.destroy

    respond_to do |format|
      format.html { redirect_to com_dates_appts_url }
      format.json { head :no_content }
    end
  end

end
