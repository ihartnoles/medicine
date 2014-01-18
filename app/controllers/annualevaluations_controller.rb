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

    @evaluator_id = 0
    @status_id = 0

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @annualevaluation }
    end
  end

  # GET /annualevaluations/1/edit
  def edit
    @title      = 'Edit Annual Evaluation'
    @description = 'Update the annual evaluation'
    @annualevaluation = Annualevaluation.find(params[:id])

    !@annualevaluation.blank? ?  @evaluator_id = User.find(params[:affiliate_id]).id : @evaluator_id = 0
    !@annualevaluation.blank? ?  @status_id    = Evaluationstatus.find(@annualevaluation.status_id).id : @status_id = 0
  end

  # POST /annualevaluations
  # POST /annualevaluations.json
  def create
    @annualevaluation = Annualevaluation.new(params[:annualevaluation])
    @annualevaluation.affiliate_id = params[:affiliate_id]

    respond_to do |format|
      if @annualevaluation.save
         format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#assignments", notice: 'Annual Evaluation Added!'}
        #format.json { render json: @annualevaluation, status: :created, location: @annualevaluation }
      else
        format.html { render action: "new" }
        #format.json { render json: @annualevaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /annualevaluations/1
  # PUT /annualevaluations/1.json
  def update
    @annualevaluation = Annualevaluation.find(params[:id])

    respond_to do |format|
      if @annualevaluation.update_attributes(params[:annualevaluation])
        format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#assignments", notice: 'Annual Evaluation Updated!' }
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
      format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#assignments", notice: 'Annual Evaluation Removed!' }
      format.json { head :no_content }
    end
  end
end
