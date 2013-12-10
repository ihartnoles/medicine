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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fellowship }
    end
  end

  # GET /fellowships/1/edit
  def edit
    @fellowship = Fellowship.find(params[:id])
  end

  # POST /fellowships
  # POST /fellowships.json
  def create
    @fellowship = Fellowship.new(params[:fellowship])

    respond_to do |format|
      if @fellowship.save
        format.html { redirect_to @fellowship, notice: 'Fellowship was successfully created.' }
        format.json { render json: @fellowship, status: :created, location: @fellowship }
      else
        format.html { render action: "new" }
        format.json { render json: @fellowship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fellowships/1
  # PUT /fellowships/1.json
  def update
    @fellowship = Fellowship.find(params[:id])

    respond_to do |format|
      if @fellowship.update_attributes(params[:fellowship])
        format.html { redirect_to @fellowship, notice: 'Fellowship was successfully updated.' }
        format.json { head :no_content }
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

    respond_to do |format|
      format.html { redirect_to fellowships_url }
      format.json { head :no_content }
    end
  end
end
