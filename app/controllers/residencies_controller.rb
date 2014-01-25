class ResidenciesController < ApplicationController
  # GET /residencies
  # GET /residencies.json
  def index
    @residencies = Residency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @residencies }
    end
  end

  # GET /residencies/1
  # GET /residencies/1.json
  def show
    @residency = Residency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @residency }
    end
  end

  # GET /residencies/new
  # GET /residencies/new.json
  def new
    @residency = Residency.new
    @title      = 'New Residency'
    @description = 'Add residency information'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @residency }
    end
  end

  # GET /residencies/1/edit
  def edit
    @residency = Residency.find(params[:id])
    @title      = 'Edit Residency'
    @description = 'Edit residency information'

    @res_specialty_id = @residency.specialty_id
  end

  # POST /residencies
  # POST /residencies.json
  def create
    @residency = Residency.new(params[:residency])
    @residency.affiliate_id = params[:affiliate_id]

    #@affiliate = Affiliate.find(params[:affiliate_id])

    respond_to do |format|
      if @residency.save
       format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#training", notice: 'Residency was successfully created.' }
        #format.json { render json: @residency, status: :created, location: @residency }
      else
        format.html { render action: "new" }
        #format.json { render json: @residency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /residencies/1
  # PUT /residencies/1.json
  def update
    @residency = Residency.find(params[:id])

    respond_to do |format|
      if @residency.update_attributes(params[:residency])
        format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#training", notice: 'Residency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @residency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /residencies/1
  # DELETE /residencies/1.json
  def destroy
    @residency = Residency.find(params[:id])
    @residency.destroy

    respond_to do |format|
      format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#training", notice: 'Residency Removed!' }
      format.json { head :no_content }
    end
  end
end
