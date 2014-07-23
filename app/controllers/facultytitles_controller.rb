class FacultytitlesController < ApplicationController
  # GET /facultytitles
  # GET /facultytitles.json
  def index

    if session[:usertype] != 4
      #redirect_to unauthorized_path
      unauthorized = 1
    end

    @facultytitles = Facultytitle.all
    @title      = 'Faculty Title List'
    @description = 'List of faculty titles'

    if unauthorized == 1
        redirect_to unauthorized_path
    else      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @facultytitles }
      end
    end
    
  end

  # GET /facultytitles/1
  # GET /facultytitles/1.json
  def show
    @facultytitle = Facultytitle.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @facultytitle }
    end
  end

  # GET /facultytitles/new
  # GET /facultytitles/new.json
  def new
    @facultytitle = Facultytitle.new
    @title      = 'New Faculty Title'
    @description = 'Add a new faculty title to the system'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @facultytitle }
    end
  end

  # GET /facultytitles/1/edit
  def edit
    @facultytitle = Facultytitle.find(params[:id])
    @title      = 'Edit Faculty title'
    @description = 'Edit a faculty title in the system'
  end

  # POST /facultytitles
  # POST /facultytitles.json
  def create
    @facultytitle = Facultytitle.new(params[:facultytitle])

    respond_to do |format|
      if @facultytitle.save
        format.html { redirect_to facultytitles_path, notice: 'Faculty title was successfully created.' }
        format.json { render json: @facultytitle, status: :created, location: @facultytitle }
      else
        format.html { render action: "new" }
        #format.json { render json: @facultytitle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /facultytitles/1
  # PUT /facultytitles/1.json
  def update
    @facultytitle = Facultytitle.find(params[:id])

    respond_to do |format|
      if @facultytitle.update_attributes(params[:facultytitle])
        format.html { redirect_to facultytitles_path, notice: 'Faculty title was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @facultytitle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facultytitles/1
  # DELETE /facultytitles/1.json
  def destroy
    @facultytitle = Facultytitle.find(params[:id])
    @facultytitle.destroy

    respond_to do |format|
      format.html { redirect_to facultytitles_url, notice: 'Hospital was successfully deleted.'  }
      format.json { head :no_content }
    end
  end
end
