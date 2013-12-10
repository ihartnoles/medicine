class ResearchareasController < ApplicationController
  # GET /researchareas
  # GET /researchareas.json
  def index
    @researchareas = Researcharea.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @researchareas }
    end
  end

  # GET /researchareas/1
  # GET /researchareas/1.json
  def show
    @researcharea = Researcharea.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @researcharea }
    end
  end

  # GET /researchareas/new
  # GET /researchareas/new.json
  def new
    @researcharea = Researcharea.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @researcharea }
    end
  end

  # GET /researchareas/1/edit
  def edit
    @researcharea = Researcharea.find(params[:id])
  end

  # POST /researchareas
  # POST /researchareas.json
  def create
    @researcharea = Researcharea.new(params[:researcharea])

    respond_to do |format|
      if @researcharea.save
        format.html { redirect_to @researcharea, notice: 'Researcharea was successfully created.' }
        format.json { render json: @researcharea, status: :created, location: @researcharea }
      else
        format.html { render action: "new" }
        format.json { render json: @researcharea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /researchareas/1
  # PUT /researchareas/1.json
  def update
    @researcharea = Researcharea.find(params[:id])

    respond_to do |format|
      if @researcharea.update_attributes(params[:researcharea])
        format.html { redirect_to @researcharea, notice: 'Researcharea was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @researcharea.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /researchareas/1
  # DELETE /researchareas/1.json
  def destroy
    @researcharea = Researcharea.find(params[:id])
    @researcharea.destroy

    respond_to do |format|
      format.html { redirect_to researchareas_url }
      format.json { head :no_content }
    end
  end
end
