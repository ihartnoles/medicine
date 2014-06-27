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

    @faculty_classification_id = Affiliate.find(params[:affiliate_id]).faculty_classification_id

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
    @faculty_classification_id = Affiliate.find(params[:affiliate_id]).faculty_classification_id

    !@annualevaluation.blank? ?  @evaluator_id = Annualevaluation.find(params[:id]).evaluator_id : @evaluator_id = 0
    !@annualevaluation.blank? ?  @status_id    = Evaluationstatus.find(@annualevaluation.status_id).id : @status_id = 0
  end

  # POST /annualevaluations
  # POST /annualevaluations.json
  def create
    @annualevaluation = Annualevaluation.new(params[:annualevaluation])
    @annualevaluation.affiliate_id = params[:affiliate_id]

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @annualevaluation.save
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#assignments", notice: 'Annual Evaluation Added!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#assignments", notice: 'Annual Evaluation Added!' }
        end
        #  format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#assignments", notice: 'Annual Evaluation Added!'}
        # #format.json { render json: @annualevaluation, status: :created, location: @annualevaluation }
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

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @annualevaluation.update_attributes(params[:annualevaluation])
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#assignments", notice: 'Annual Evaluation Updated!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#assignments", notice: 'Annual Evaluation Updated!' }
        end

        # format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#assignments", notice: 'Annual Evaluation Updated!' }
        # format.json { head :no_content }
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

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#assignments", notice: 'Annual Evaluation Removed!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#assignments", notice: 'Annual Evaluation Removed!' }
        end

      # format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#assignments", notice: 'Annual Evaluation Removed!' }
      # format.json { head :no_content }
    end
  end
end
