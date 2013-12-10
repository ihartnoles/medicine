class AffiliateresearchareasController < ApplicationController
  # GET /affiliateresearchareas
  # GET /affiliateresearchareas.json
  def index
    @affiliateresearchareas = Affiliateresearcharea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @affiliateresearchareas }
    end
  end

  # GET /affiliateresearchareas/1
  # GET /affiliateresearchareas/1.json
  def show
    @affiliateresearcharea = Affiliateresearcharea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @affiliateresearcharea }
    end
  end

  # GET /affiliateresearchareas/new
  # GET /affiliateresearchareas/new.json
  def new
    @affiliateresearcharea = Affiliateresearcharea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @affiliateresearcharea }
    end
  end

  # GET /affiliateresearchareas/1/edit
  def edit
    @affiliateresearcharea = Affiliateresearcharea.find(params[:id])
  end

  # POST /affiliateresearchareas
  # POST /affiliateresearchareas.json
  def create
    @affiliateresearcharea = Affiliateresearcharea.new(params[:affiliateresearcharea])

    respond_to do |format|
      if @affiliateresearcharea.save
        format.html { redirect_to @affiliateresearcharea, notice: 'Affiliateresearcharea was successfully created.' }
        format.json { render json: @affiliateresearcharea, status: :created, location: @affiliateresearcharea }
      else
        format.html { render action: "new" }
        format.json { render json: @affiliateresearcharea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /affiliateresearchareas/1
  # PUT /affiliateresearchareas/1.json
  def update
    @affiliateresearcharea = Affiliateresearcharea.find(params[:id])

    respond_to do |format|
      if @affiliateresearcharea.update_attributes(params[:affiliateresearcharea])
        format.html { redirect_to @affiliateresearcharea, notice: 'Affiliateresearcharea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @affiliateresearcharea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /affiliateresearchareas/1
  # DELETE /affiliateresearchareas/1.json
  def destroy
    @affiliateresearcharea = Affiliateresearcharea.find(params[:id])
    @affiliateresearcharea.destroy

    respond_to do |format|
      format.html { redirect_to affiliateresearchareas_url }
      format.json { head :no_content }
    end
  end
end
