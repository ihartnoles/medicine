class CapDatesController < ApplicationController
  # GET /cap_dates
  # GET /cap_dates.json
  def index
    @cap_dates = CapDate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cap_dates }
    end
  end

  # GET /cap_dates/1
  # GET /cap_dates/1.json
  def show
    @cap_date = CapDate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cap_date }
    end
  end

  # GET /cap_dates/new
  # GET /cap_dates/new.json
  def new
    @cap_date = CapDate.new
    @title      = 'New CAP Date'
    @description = 'Add a new CAP date'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cap_date }
    end
  end

  # GET /cap_dates/1/edit
  def edit
    @title      = 'Edit CAP Date'
    @description = 'Edit existing CAP dates'
    @cap_date = CapDate.find(params[:id])
  end

  # POST /cap_dates
  # POST /cap_dates.json
  def create
    @cap_date = CapDate.new(params[:cap_date])
    @cap_date.affiliate_id = params[:affiliate_id]

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @cap_date.save
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#appointments", notice: 'CAP Date Added!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#appointments", notice: 'CAP Date Added!' }
        end
        # format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#appointments", notice: 'CAP Date Added!'}
        # format.json { render json: @cap_date, status: :created, location: @cap_date }
      else
        format.html { render action: "new" }
        format.json { render json: @cap_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cap_dates/1
  # PUT /cap_dates/1.json
  def update
    @cap_date = CapDate.find(params[:id])

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @cap_date.update_attributes(params[:cap_date])
         if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#appointments", notice: 'CAP Date Updated!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#appointments", notice: 'CAP Date Updated!' }
        end
        # format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#appointments", notice: 'CAP Date Updated!'}
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cap_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cap_dates/1
  # DELETE /cap_dates/1.json
  def destroy
    @cap_date = CapDate.find(params[:id])
    @cap_date.destroy

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
       if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#appointments", notice: 'CAP Date Removed!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#appointments", notice: 'CAP Date Removed!' }
        end
      # format.html { redirect_to cap_dates_url }
      # format.json { head :no_content }
    end
  end
end
