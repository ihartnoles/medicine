class DegreesController < ApplicationController
  # GET /degrees
  # GET /degrees.json
  def index
    @degrees = Degree.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @degrees }
    end
  end

  # GET /degrees/1
  # GET /degrees/1.json
  def show
    @degree = Degree.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @degree }
    end
  end

  # GET /degrees/new
  # GET /degrees/new.json
  def new
    @degree = Degree.new
    @title      = 'New Degree'
    @description = 'Add a new degree'

    @institutions =  Institution.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @degree }
    end
  end

  # GET /degrees/1/edit
  def edit
    @degree = Degree.find(params[:id])
    @title      = 'Edit Degree'
    @description = 'Edit degree'
  end

  # POST /degrees
  # POST /degrees.json
  def create
    @degree = Degree.new(params[:degree])
    @degree.affiliate_id = params[:affiliate_id]

    @affiliate = Affiliate.find(params[:affiliate_id])

    respond_to do |format|
      if @degree.save
        format.html { redirect_to @affiliate, notice: 'Degree was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /degrees/1
  # PUT /degrees/1.json
  def update
    @degree = Degree.find(params[:id])
    @affiliate = Affiliate.find(params[:affiliate_id])


    respond_to do |format|
      if @degree.update_attributes(params[:degree])
        format.html { redirect_to affiliate_url(:id => params[:affiliate_id]), notice: 'Degree was successfully updated.', notice: 'Degree was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @degree.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /degrees/1
  # DELETE /degrees/1.json
  def destroy
    @degree = Degree.find(params[:id])
    @degree.destroy

    respond_to do |format|
      format.html { redirect_to affiliate_url(:id => params[:affiliate_id]), notice: 'Degree Removed!'  }
      format.json { head :no_content }
    end
  end
end
