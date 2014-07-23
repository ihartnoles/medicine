class CapstatusesController < ApplicationController
  # GET /capstatus
  # GET /capstatus.json
  def index

    if session[:usertype] != 4
      #redirect_to unauthorized_path
      unauthorized = 1
    end

    @capstatus = Capstatus.all
    @title      = 'CAP Status List'
    @description = 'List of Cap Statuses'

    if unauthorized == 1
        redirect_to unauthorized_path
    else      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @capstatus }
      end
    end
  end

  # GET /capstatus/1
  # GET /capstatus/1.json
  def show
    @capstatus = Capstatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @capstatus }
    end
  end

  # GET /capstatus/new
  # GET /capstatus/new.json
  def new
    @capstatus = Capstatus.new
    @title      = 'New Cap Status'
    @description = 'Add a new cap status to the system'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @capstatus }
    end
  end

  # GET /capstatus/1/edit
  def edit
    @capstatus = Capstatus.find(params[:id])
    @title      = 'Edit Cap Status'
    @description = 'Edit a cap status option in the system'
  end

  # POST /capstatus
  # POST /capstatus.json
  def create
    @capstatus = Capstatus.new(params[:capstatus])
    

    respond_to do |format|
      if @capstatus.save
        format.html { redirect_to capstatuses_path, notice: 'Cap status was successfully created.' }
        format.json { render json: @capstatus, status: :created, location: @capstatus }
      else
        format.html { render action: "new" }
        format.json { render json: @capstatus.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /capstatus/1
  # PUT /capstatus/1.json
  def update
    @capstatus = Capstatus.find(params[:id])

    respond_to do |format|
      if @capstatus.update_attributes(params[:capstatus])
        format.html { redirect_to capstatuses_path, notice: 'Cap status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @capstatus.errors, capstatus: :unprocessable_entity }
      end
    end
  end

  # DELETE /capstatus/1
  # DELETE /capstatus/1.json
  def destroy
    @capstatus = Capstatus.find(params[:id])
    @capstatus.destroy

    respond_to do |format|
      format.html { redirect_to capstatuses_path, notice: 'Cap status was successfully deleted.'  }
      format.json { head :no_content }
    end
  end
end
