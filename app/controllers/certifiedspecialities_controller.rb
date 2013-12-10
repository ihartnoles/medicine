class CertifiedspecialitiesController < ApplicationController
  # GET /certifiedspecialities
  # GET /certifiedspecialities.json
  def index
    @certifiedspecialities = Certifiedspeciality.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @certifiedspecialities }
    end
  end

  # GET /certifiedspecialities/1
  # GET /certifiedspecialities/1.json
  def show
    @certifiedspeciality = Certifiedspeciality.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @certifiedspeciality }
    end
  end

  # GET /certifiedspecialities/new
  # GET /certifiedspecialities/new.json
  def new
    @certifiedspeciality = Certifiedspeciality.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @certifiedspeciality }
    end
  end

  # GET /certifiedspecialities/1/edit
  def edit
    @certifiedspeciality = Certifiedspeciality.find(params[:id])
  end

  # POST /certifiedspecialities
  # POST /certifiedspecialities.json
  def create
    @certifiedspeciality = Certifiedspeciality.new(params[:certifiedspeciality])

    respond_to do |format|
      if @certifiedspeciality.save
        format.html { redirect_to @certifiedspeciality, notice: 'Certifiedspeciality was successfully created.' }
        format.json { render json: @certifiedspeciality, status: :created, location: @certifiedspeciality }
      else
        format.html { render action: "new" }
        format.json { render json: @certifiedspeciality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /certifiedspecialities/1
  # PUT /certifiedspecialities/1.json
  def update
    @certifiedspeciality = Certifiedspeciality.find(params[:id])

    respond_to do |format|
      if @certifiedspeciality.update_attributes(params[:certifiedspeciality])
        format.html { redirect_to @certifiedspeciality, notice: 'Certifiedspeciality was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @certifiedspeciality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certifiedspecialities/1
  # DELETE /certifiedspecialities/1.json
  def destroy
    @certifiedspeciality = Certifiedspeciality.find(params[:id])
    @certifiedspeciality.destroy

    respond_to do |format|
      format.html { redirect_to certifiedspecialities_url }
      format.json { head :no_content }
    end
  end
end
