class AnnualevaluationsController < ApplicationController
  # GET /annualevaluations
  # GET /annualevaluations.json
  def index
    @annualevaluations = Annualevaluation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @annualevaluations }
    end
  end

  # GET /annualevaluations/1
  # GET /annualevaluations/1.json
  def show
    @annualevaluation = Annualevaluation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @annualevaluation }
    end
  end

  # GET /annualevaluations/new
  # GET /annualevaluations/new.json
  def new
    @annualevaluation = Annualevaluation.new
    @title      = 'New Evaluation'
    @description = 'Add a new evaluation'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @annualevaluation }
    end
  end

  # GET /annualevaluations/1/edit
  def edit
    @annualevaluation = Annualevaluation.find(params[:id])
  end

  # POST /annualevaluations
  # POST /annualevaluations.json
  def create
    @annualevaluation = Annualevaluation.new(params[:annualevaluation])

    respond_to do |format|
      if @annualevaluation.save
        format.html { redirect_to @annualevaluation, notice: 'Annualevaluation was successfully created.' }
        format.json { render json: @annualevaluation, status: :created, location: @annualevaluation }
      else
        format.html { render action: "new" }
        format.json { render json: @annualevaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /annualevaluations/1
  # PUT /annualevaluations/1.json
  def update
    @annualevaluation = Annualevaluation.find(params[:id])

    respond_to do |format|
      if @annualevaluation.update_attributes(params[:annualevaluation])
        format.html { redirect_to @annualevaluation, notice: 'Annualevaluation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @annualevaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /annualevaluations/1
  # DELETE /annualevaluations/1.json
  def destroy
    @annualevaluation = Annualevaluation.find(params[:id])
    @annualevaluation.destroy

    respond_to do |format|
      format.html { redirect_to annualevaluations_url }
      format.json { head :no_content }
    end
  end
end
