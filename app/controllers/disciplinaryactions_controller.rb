class DisciplinaryactionsController < ApplicationController
  # GET /disciplinaryactions
  # GET /disciplinaryactions.json
  def index
    @disciplinaryactions = Disciplinaryaction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @disciplinaryactions }
    end
  end

  # GET /disciplinaryactions/1
  # GET /disciplinaryactions/1.json
  def show
    @disciplinaryaction = Disciplinaryaction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @disciplinaryaction }
    end
  end

  # GET /disciplinaryactions/new
  # GET /disciplinaryactions/new.json
  def new
    @disciplinaryaction = Disciplinaryaction.new
    @title      = 'New Disciplinary Action'
    @description = 'Add a new disciplinary action'
    @affiliate_id = params[:affiliate_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @disciplinaryaction }
    end
  end

  # GET /disciplinaryactions/1/edit
  def edit
    @title      = 'Edit Disciplinary Action'
    @description = 'Update the disciplinary action'
    @disciplinaryaction = Disciplinaryaction.find(params[:id])

    !@disciplinaryaction.blank? ?  @action = Disciplinaryaction.find(params[:id]).disciplinaryaction : @action = 0
    !@disciplinaryaction.blank? ?  @removed = Disciplinaryaction.find(params[:id]).removed : @removed = 0
  end

  # POST /disciplinaryactions
  # POST /disciplinaryactions.json
  def create
    @title      = 'New Disciplinary Action'
    @description = 'Add a new disciplinary action'
    @disciplinaryaction = Disciplinaryaction.new(params[:disciplinaryaction])
    @affiliate_id = params[:disciplinaryaction][:affiliate_id]

    respond_to do |format|
      if @disciplinaryaction.save
        format.html { redirect_to affiliate_url(:id => params[:disciplinaryaction][:affiliate_id]) + "#assignments", notice: 'Disciplinary Action Added!' }
        #format.json { render json: @disciplinaryaction, status: :created, location: @disciplinaryaction }
      else
        format.html { render action: "new" }
        #format.json { render json: @disciplinaryaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /disciplinaryactions/1
  # PUT /disciplinaryactions/1.json
  def update
    @disciplinaryaction = Disciplinaryaction.find(params[:id])
  
    respond_to do |format|
      if @disciplinaryaction.update_attributes(params[:disciplinaryaction])
        format.html { redirect_to affiliate_url(:id => params[:disciplinaryaction][:affiliate_id]) + "#assignments", notice: 'Disciplinary Action Updated!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @disciplinaryaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplinaryactions/1
  # DELETE /disciplinaryactions/1.json
  def destroy
    @disciplinaryaction = Disciplinaryaction.find(params[:id])
    @disciplinaryaction.destroy

    respond_to do |format|
      format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#assignments", notice: 'Disciplinary Action Removed!' }
      format.json { head :no_content }
    end
  end
end
