class FellowshipsController < ApplicationController
  # GET /fellowships
  # GET /fellowships.json
  def index
    @fellowships = Fellowship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fellowships }
    end
  end

  # GET /fellowships/1
  # GET /fellowships/1.json
  def show
    @fellowship = Fellowship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fellowship }
    end
  end

  # GET /fellowships/new
  # GET /fellowships/new.json
  def new
    @fellowship = Fellowship.new
    @title      = 'New Fellowship'
    @description = 'Add fellowship information'

    @specialties  = Clinicalspecialty.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fellowship }
    end
  end

  # GET /fellowships/1/edit
  def edit
    @fellowship = Fellowship.find(params[:id])
    @title      = 'Edit Fellowship'
    @description = 'Edit fellowship information'

    @fellowshipspecialty_id = @fellowship.specialty_id
  end

  # POST /fellowships
  # POST /fellowships.json
  def create
    @fellowship = Fellowship.new(params[:fellowship])
    @fellowship.affiliate_id = params[:affiliate_id]

    @affiliate = Affiliate.find(params[:affiliate_id])

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @fellowship.save
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#training", notice: 'Fellowship was successfully created!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#training", notice: 'Fellowship was successfully created!' }
        end
        # format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#training", notice: 'Fellowship was successfully created.' }
        #format.json { render json: @fellowship, status: :created, location: @fellowship }
      else
        format.html { render action: "new" }
        #format.json { render json: @fellowship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fellowships/1
  # PUT /fellowships/1.json
  def update
    @fellowship = Fellowship.find(params[:id])
    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @fellowship.update_attributes(params[:fellowship])
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#training", notice: 'Fellowship was successfully updated!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#training", notice: 'Fellowship was successfully updated!' }
        end
        # format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#training", notice: 'Fellowship was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fellowship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fellowships/1
  # DELETE /fellowships/1.json
  def destroy
    @fellowship = Fellowship.find(params[:id])
    @fellowship.destroy

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#training", notice: 'Fellowship Removed!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#training", notice: 'Fellowship Removed!' }
        end
      # format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#training", notice: 'Fellowship Removed!' }
      # format.json { head :no_content }
    end
  end
end
