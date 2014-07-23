class PermissiongroupsController < ApplicationController
  # GET /permissiongroups
  # GET /permissiongroups.json
  def index

     if session[:usertype] != 4
      #redirect_to unauthorized_path
      unauthorized = 1
    end

    @permissiongroups = Permissiongroup.all
    @title      = 'Permission Groups'
    @description = 'A list of permission groups'

    if unauthorized == 1
        redirect_to unauthorized_path
    else      
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @permissiongroups }
      end
    end
    
  end

  # GET /permissiongroups/1
  # GET /permissiongroups/1.json
  def show
    @permissiongroup = Permissiongroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @permissiongroup }
    end
  end

  # GET /permissiongroups/new
  # GET /permissiongroups/new.json
  def new
    @permissiongroup = Permissiongroup.new
    @title      = 'Add Permission Group'
    @description = 'Add a permission group option to the system'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @permissiongroup }
    end
  end

  # GET /permissiongroups/1/edit
  def edit
    @permissiongroup = Permissiongroup.find(params[:id])
    @title      = 'Edit Permission Group'
    @description = 'Edit a permission group option in the system'
  end

  # POST /permissiongroups
  # POST /permissiongroups.json
  def create
    @permissiongroup = Permissiongroup.new(params[:permissiongroup])

    respond_to do |format|
      if @permissiongroup.save
        format.html { redirect_to @permissiongroup, notice: 'Permission Group was successfully created.' }
        format.json { render json: @permissiongroup, status: :created, location: @permissiongroup }
      else
        format.html { render action: "new" }
        format.json { render json: @permissiongroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /permissiongroups/1
  # PUT /permissiongroups/1.json
  def update
    @permissiongroup = Permissiongroup.find(params[:id])

    respond_to do |format|
      if @permissiongroup.update_attributes(params[:permissiongroup])
        format.html { redirect_to permissiongroups_path, notice: 'Permission Group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @permissiongroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissiongroups/1
  # DELETE /permissiongroups/1.json
  def destroy
    @permissiongroup = Permissiongroup.find(params[:id])
    @permissiongroup.destroy

    respond_to do |format|
      format.html { redirect_to permissiongroups_path, notice: 'Permission Group was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
