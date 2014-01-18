class EvaluationstatusesController < ApplicationController
  # GET /evaluationstatuses
  # GET /evaluationstatuses.json
  def index
    @evaluationstatuses = Evaluationstatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evaluationstatuses }
    end
  end

  # GET /evaluationstatuses/1
  # GET /evaluationstatuses/1.json
  def show
    @evaluationstatus = Evaluationstatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evaluationstatus }
    end
  end

  # GET /evaluationstatuses/new
  # GET /evaluationstatuses/new.json
  def new
    @evaluationstatus = Evaluationstatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evaluationstatus }
    end
  end

  # GET /evaluationstatuses/1/edit
  def edit
    @evaluationstatus = Evaluationstatus.find(params[:id])
  end

  # POST /evaluationstatuses
  # POST /evaluationstatuses.json
  def create
    @evaluationstatus = Evaluationstatus.new(params[:evaluationstatus])

    respond_to do |format|
      if @evaluationstatus.save
        format.html { redirect_to @evaluationstatus, notice: 'Evaluationstatus was successfully created.' }
        format.json { render json: @evaluationstatus, status: :created, location: @evaluationstatus }
      else
        format.html { render action: "new" }
        format.json { render json: @evaluationstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /evaluationstatuses/1
  # PUT /evaluationstatuses/1.json
  def update
    @evaluationstatus = Evaluationstatus.find(params[:id])

    respond_to do |format|
      if @evaluationstatus.update_attributes(params[:evaluationstatus])
        format.html { redirect_to @evaluationstatus, notice: 'Evaluationstatus was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evaluationstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluationstatuses/1
  # DELETE /evaluationstatuses/1.json
  def destroy
    @evaluationstatus = Evaluationstatus.find(params[:id])
    @evaluationstatus.destroy

    respond_to do |format|
      format.html { redirect_to evaluationstatuses_url }
      format.json { head :no_content }
    end
  end
end