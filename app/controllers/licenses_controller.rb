class LicensesController < ApplicationController
  # GET /licenses
  # GET /licenses.json
  def index
    @licenses = License.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @licenses }
    end
  end

  # GET /licenses/1
  # GET /licenses/1.json
  def show
    @license = License.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @license }
    end
  end

  # GET /licenses/new
  # GET /licenses/new.json
  def new
    @license = License.new
    @title      = 'New Medical License'
    @description = 'Add a new medical license'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @license }
    end
  end

  # GET /licenses/1/edit
  def edit
    @license = License.find(params[:id])
    @title      = 'Edit Medical License'
    @description = 'Edit existing medical license'
  end

  # POST /licenses
  # POST /licenses.json
  def create
    @license = License.new(params[:license])
    @license.affiliate_id = params[:affiliate_id]

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end


    respond_to do |format|
      if @license.save
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#training", notice: 'Medical License Added!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#training", notice: 'Medical License Added!' }
        end

        #format.html { redirect_to @license, notice: 'License was successfully created.' }
        #format.json { render json: @license, status: :created, location: @license }
      else
        format.html { render action: "new" }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /licenses/1
  # PUT /licenses/1.json
  def update
    @license = License.find(params[:id])
    
    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @license.update_attributes(params[:license])
         if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#training", notice: 'Medical License Updated!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#training", notice: 'Medical License Updated!' }
        end

        # format.html { redirect_to @license, notice: 'License was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @license.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /licenses/1
  # DELETE /licenses/1.json
  def destroy
    @license = License.find(params[:id])
    @license.destroy

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end


    respond_to do |format|
      if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#training", notice: 'Medical License Removed!' }
      else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#training", notice: 'Medical License Removed!' }
      end
      # format.html { redirect_to licenses_url }
      # format.json { head :no_content }
    end
  end
end
