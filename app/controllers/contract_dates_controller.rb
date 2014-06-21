class ContractDatesController < ApplicationController
  # GET /contract_dates
  # GET /contract_dates.json
  def index
    @contract_dates = ContractDate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contract_dates }
    end
  end

  # GET /contract_dates/1
  # GET /contract_dates/1.json
  def show
    @contract_date = ContractDate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contract_date }
    end
  end

  # GET /contract_dates/new
  # GET /contract_dates/new.json
  def new
    @contract_date = ContractDate.new
    @title      = 'New Contract Date'
    @description = 'Add a new Contract date'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contract_date }
    end
  end

  # GET /contract_dates/1/edit
  def edit
    @title      = 'Edit Contract Date'
    @description = 'Edit existing contract dates'
    @contract_date = ContractDate.find(params[:id])
  end

  # POST /contract_dates
  # POST /contract_dates.json
  def create
    @contract_date = ContractDate.new(params[:contract_date])
    @contract_date.affiliate_id = params[:affiliate_id]

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @contract_date.save

        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#appointments", notice: 'Contract date was successfully added!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#appointments", notice: 'Contract date was successfully added!' }
        end
        
        # format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#appointments", notice: 'Contract Date Added!'}
        # format.json { render json: @contract_date, status: :created, location: @contract_date }
      else
        format.html { render action: "new" }
        format.json { render json: @contract_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contract_dates/1
  # PUT /contract_dates/1.json
  def update
    @contract_date = ContractDate.find(params[:id])

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @contract_date.update_attributes(params[:contract_date])
        
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#appointments", notice: 'Contract date was successfully updated!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#appointments", notice: 'Contract date was successfully updated!' }
        end

        # format.html { redirect_to affiliate_url(:id => params[:affiliate_id]) + "#appointments", notice: 'Contract Date Updated!'}
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contract_date.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contract_dates/1
  # DELETE /contract_dates/1.json
  def destroy
    @contract_date = ContractDate.find(params[:id])
    @contract_date.destroy

    @isfacultyflag = Affiliate.find(params[:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:affiliate_id]).pidm
    end

    respond_to do |format|
      if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id], :pidm => @pidm) + "#appointments", notice: 'Contract date removed!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:affiliate_id])+ "#appointments", notice: 'Contract date remmoved!' }
        end
      # format.html { redirect_to contract_dates_url }
      # format.json { head :no_content }
    end
  end
end
