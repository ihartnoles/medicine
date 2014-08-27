class FacultyDatesController < ApplicationController
  # GET /faculty_dates
  # GET /faculty_dates.json
  def index
    @faculty_dates = FacultyDate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faculty_dates }
    end
  end

  # GET /faculty_dates/1
  # GET /faculty_dates/1.json
  def show
    @faculty_date = FacultyDate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @faculty_date }
    end
  end

  # GET /faculty_dates/new
  # GET /faculty_dates/new.json
  def new
    @faculty_date = FacultyDate.new
    @title      = 'New Faculty Date'
    @description = 'Add a new Faculty date'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @faculty_date }
    end
  end

  # GET /faculty_dates/1/edit
  def edit
    @title      = 'Edit Faculty Date'
    @description = 'Edit existing Faculty dates'
    @faculty_date = FacultyDate.find(params[:id])
  end

  # POST /faculty_dates
  # POST /faculty_dates.json
  def create
    @faculty_date = FacultyDate.new(params[:faculty_date])
    @faculty_date.affiliate_id = params[:affiliate_id]
    
    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @faculty_date.save
         if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#appointments", notice: 'Faculty Date Added!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#appointments", notice: 'Faculty Date Added!' }
        end
        
      else
        format.html { render action: "new" }

      end
    end
  end

  # PUT /faculty_dates/1
  # PUT /faculty_dates/1.json
  def update
    @faculty_date = FacultyDate.find(params[:id])

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @faculty_date.update_attributes(params[:faculty_date])
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#appointments", notice: 'Faculty Date Updated!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#appointments", notice: 'Faculty Date Updated!' }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @faculty_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculty_dates/1
  # DELETE /faculty_dates/1.json
  def destroy
    @faculty_date = FacultyDate.find(params[:id])
    @faculty_date.destroy

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
    end
  end
end
