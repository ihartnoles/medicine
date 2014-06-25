class FacultyClassificationsController < ApplicationController
  # GET /faculty_classifications
  # GET /faculty_classifications.json
  def index
    @faculty_classifications = FacultyClassification.all
    @title      = 'Faculty Classification List'
    @description = 'List of faculty classifications'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @faculty_classifications }
    end
  end

  # GET /faculty_classifications/1
  # GET /faculty_classifications/1.json
  def show
    @faculty_classification = FacultyClassification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @faculty_classification }
    end
  end

  # GET /faculty_classifications/new
  # GET /faculty_classifications/new.json
  def new
    @faculty_classification = FacultyClassification.new
    @title      = 'New Faculty Classification'
    @description = 'Add a new faculty classification to the system'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @faculty_classification }
    end
  end

  # GET /faculty_classifications/1/edit
  def edit
    @faculty_classification = FacultyClassification.find(params[:id])
    @title      = 'Edit Faculty classification'
    @description = 'Edit a faculty classification in the system'
  end

  # POST /faculty_classifications
  # POST /faculty_classifications.json
  def create
    @faculty_classification = FacultyClassification.new(params[:faculty_classification])

    respond_to do |format|
      if @faculty_classification.save
        format.html { redirect_to faculty_classifications_path, notice: 'Faculty classification was successfully created.' }
        format.json { render json: @faculty_classification, status: :created, location: @faculty_classification }
      else
        format.html { render action: "new" }
        format.json { render json: @faculty_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /faculty_classifications/1
  # PUT /faculty_classifications/1.json
  def update
    @faculty_classification = FacultyClassification.find(params[:id])

    respond_to do |format|
      if @faculty_classification.update_attributes(params[:faculty_classification])
        #format.html { redirect_to @faculty_classification, notice: 'Faculty classification was successfully updated.' }
        format.html { redirect_to faculty_classifications_path, notice: 'Faculty classification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @faculty_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /faculty_classifications/1
  # DELETE /faculty_classifications/1.json
  def destroy
    @faculty_classification = FacultyClassification.find(params[:id])
    @faculty_classification.destroy

    respond_to do |format|
      format.html { redirect_to faculty_classifications_url, notice: 'Faculty classification was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
