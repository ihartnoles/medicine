class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index

    if session[:usertype] != 4
      #redirect_to unauthorized_path
      unauthorized = 1
    end

    @users = User.all
    @title      = 'User List'
    @description = 'Users who have access to the system'

    if unauthorized == 1
        redirect_to unauthorized_path
    else
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @users }
      end
    end

  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @title      = 'New User'
    @description = 'Add a new user to the system'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @title      = 'Edit User'
    @description = 'Update a user'
    @permissions = Permissiongroup.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])


    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    #@user.access = params[:access]
     
    # #loop over selections and save
    # if params.has_key?("access")
    #  #clear out any existing in database
    #  Useraccesslevel.where('affiliate_id' => params[:id]).destroy_all

    #   params[:access][:facultyclassification_ids].each do | i |          
    #       @Useraccesslevel = Useraccesslevel.new(:facultyclassification_id => i,:affiliate_id => params[:id])
    #       @Useraccesslevel.save
    #   end        
    # end


    set_poweruser_accesslevels

    set_sessionvars

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      format.json { head :no_content }
    end
  end


  private

  def set_poweruser_accesslevels
     #loop over selections and save
    if params.has_key?("access")
     #clear out any existing in database
     Useraccesslevel.where('affiliate_id' => params[:id]).destroy_all

      params[:access][:facultyclassification_ids].each do | i |          
          @Useraccesslevel = Useraccesslevel.new(:facultyclassification_id => i,:affiliate_id => params[:id])
          @Useraccesslevel.save
      end        
    end
  end

  def set_sessionvars
    #set the session usertype variable
    session[:usertype]  = params[:user][:usertype_id].to_i

    if params[:user][:usertype_id]
      session[:poweruseraccess] = Useraccesslevel.where(:affiliate_id => session[:userid]).pluck(:facultyclassification_id)
    else

    end
  end

  def has_admin_access
    if session[:usertype] != 4
      #redirect_to unauthorized_path
      unauthorized = 1
    end
  end

end
