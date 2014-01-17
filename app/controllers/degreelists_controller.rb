class DegreelistsController < ApplicationController
  # GET /degreelists
  # GET /degreelists.json
  def index
    @degreelists = Degreelist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @degreelists }
    end
  end

  # GET /degreelists/1
  # GET /degreelists/1.json
  def show
    @degreelist = Degreelist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @degreelist }
    end
  end

  # GET /degreelists/new
  # GET /degreelists/new.json
  def new
    @degreelist = Degreelist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @degreelist }
    end
  end

  # GET /degreelists/1/edit
  def edit
    @degreelist = Degreelist.find(params[:id])
  end

  # POST /degreelists
  # POST /degreelists.json
  def create
    @degreelist = Degreelist.new(params[:degreelist])

    respond_to do |format|
      if @degreelist.save
        format.html { redirect_to @degreelist, notice: 'Degreelist was successfully created.' }
        format.json { render json: @degreelist, status: :created, location: @degreelist }
      else
        format.html { render action: "new" }
        format.json { render json: @degreelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /degreelists/1
  # PUT /degreelists/1.json
  def update
    @degreelist = Degreelist.find(params[:id])

    respond_to do |format|
      if @degreelist.update_attributes(params[:degreelist])
        format.html { redirect_to @degreelist, notice: 'Degreelist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @degreelist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /degreelists/1
  # DELETE /degreelists/1.json
  def destroy
    @degreelist = Degreelist.find(params[:id])
    @degreelist.destroy

    respond_to do |format|
      format.html { redirect_to degreelists_url }
      format.json { head :no_content }
    end
  end
end
