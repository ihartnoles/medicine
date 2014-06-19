class BasicsciencedisciplinesController < ApplicationController
  # GET /basicsciencedisciplines
  # GET /basicsciencedisciplines.json
  def index
    @basicsciencedisciplines = Basicsciencediscipline.all
    @title      = 'Basic Science Disciplines'
    @description = 'List of Basic Science Disciplines'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @basicsciencedisciplines }
    end
  end

  # GET /basicsciencedisciplines/1
  # GET /basicsciencedisciplines/1.json
  def show
    @basicsciencediscipline = Basicsciencediscipline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @basicsciencediscipline }
    end
  end

  # GET /basicsciencedisciplines/new
  # GET /basicsciencedisciplines/new.json
  def new
    @basicsciencediscipline = Basicsciencediscipline.new
    @title      = 'New Basic Science Discipline'
    @description = 'Add a new basic science discipline'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @basicsciencediscipline }
    end
  end

  # GET /basicsciencedisciplines/1/edit
  def edit
    @basicsciencediscipline = Basicsciencediscipline.find(params[:id])
    @title      = 'Edit Basic Science Discipline'
    @description = 'Update a basic science discipline'
  end

  # POST /basicsciencedisciplines
  # POST /basicsciencedisciplines.json
  def create
    @basicsciencediscipline = Basicsciencediscipline.new(params[:basicsciencediscipline])

    respond_to do |format|
      if @basicsciencediscipline.save
        format.html { redirect_to basicsciencedisciplines_path, notice: 'Basic science discipline was successfully created.' }
        format.json { render json: @basicsciencediscipline, status: :created, location: @basicsciencediscipline }
      else
        format.html { render action: "new" }
        format.json { render json: @basicsciencediscipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /basicsciencedisciplines/1
  # PUT /basicsciencedisciplines/1.json
  def update
    @basicsciencediscipline = Basicsciencediscipline.find(params[:id])

    respond_to do |format|
      if @basicsciencediscipline.update_attributes(params[:basicsciencediscipline])
        format.html { redirect_to basicsciencedisciplines_path, notice: 'Basic science discipline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @basicsciencediscipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basicsciencedisciplines/1
  # DELETE /basicsciencedisciplines/1.json
  def destroy
    @basicsciencediscipline = Basicsciencediscipline.find(params[:id])
    @basicsciencediscipline.destroy

    respond_to do |format|
      format.html { redirect_to basicsciencedisciplines_url }
      format.json { head :no_content }
    end
  end
end
