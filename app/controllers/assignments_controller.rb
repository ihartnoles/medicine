class AssignmentsController < ApplicationController
  # GET /assignments
  # GET /assignments.json
  def index
    @assignments = Assignment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @assignments }
    end
  end

  # GET /assignments/1
  # GET /assignments/1.json
  def show
    @assignment = Assignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/new
  # GET /assignments/new.json
  def new
    @assignment = Assignment.new
    @title      = 'New Assignment'
    @description = 'Add a new assignment'
    @affiliate_id = params[:affiliate_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @assignment }
    end
  end

  # GET /assignments/1/edit
  def edit
    @title      = 'Edit Assignment'
    @description = 'Update the assignment'
    @assignment = Assignment.find(params[:id])
    @affiliate_id = params[:affiliate_id]   

    #!@clinicalspecialty.blank? ? @clinicalspecialty_id = Clinicalspecialty.find(params[:id]).speciality_id : @clinicalspecialty_id = 0
    #!@clinicalspecialty.blank? ? @basicsciencediscipline_id = Clinicalspecialty.find(params[:id]).basicsciencediscipline_id : @basicsciencediscipline_id = 0
  end

  # POST /assignments
  # POST /assignments.json
  def create
    @title      = 'New Assignment'
    @description = 'Add a new assignment'
    @assignment = Assignment.new(params[:assignment])
    @affiliate_id = params[:assignment][:affiliate_id]
    @isfacultyflag = Affiliate.find(params[:assignment][:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:assignment][:affiliate_id]).pidm
    end

    respond_to do |format|
      if @assignment.save
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:assignment][:affiliate_id], :pidm => @pidm) + "#assignments", notice: 'Assignment added!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:assignment][:affiliate_id])+ "#assignments", notice: 'Assignment added!' }
        end
        #format.html { redirect_to @assignment, notice: 'Assignment was successfully created.' }
        #format.json { render json: @assignment, status: :created, location: @assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /assignments/1
  # PUT /assignments/1.json
  def update
    @assignment = Assignment.find(params[:id])

    @isfacultyflag = Affiliate.find(params[:assignment][:affiliate_id]).isfaculty

    if @isfacultyflag
      @pidm = Affiliate.find(params[:assignment][:affiliate_id]).pidm
    end


    respond_to do |format|
      if @assignment.update_attributes(params[:assignment])
        if @isfacultyflag
          format.html { redirect_to affiliate_url(:id => params[:assignment][:affiliate_id], :pidm => @pidm) + "#assignments", notice: 'Assignment updated!' }
        else
          format.html { redirect_to affiliate_url(:id => params[:assignment][:affiliate_id])+ "#assignments", notice: 'Assignment updated!' }
        end

        # format.html { redirect_to @assignment, notice: 'Assignment was successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assignments/1
  # DELETE /assignments/1.json
  def destroy
    @assignment = Assignment.find(params[:id])
    @assignment.destroy

    respond_to do |format|
      format.html { redirect_to assignments_url }
      format.json { head :no_content }
    end
  end
end
