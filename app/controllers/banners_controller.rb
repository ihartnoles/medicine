class BannersController < ApplicationController
  # GET /banners
  # GET /banners.json
  def index
    #@banners = Banner.all
    @banners = Banner.get_objects
    @title      = 'Banner Queue'
    @description = 'CoM data in Banner'

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @banners }
    end
  end

  # GET /banners/1
  # GET /banners/1.json
  def show
    #@banner = Banner.find(params[:id])
    @banner = Banner.find_by_id(params[:pidm])

    @title      = 'Banner Details'
    @description = 'Detailed Banner Data'

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @banner }
    end
  end
 
  # GET /banners/doe
   def showmatches
    #@banner = Banner.find(params[:id])
    @affiliate = Affiliate.find(params[:affiliateid])
    @banner = Banner.find_matches(params[:lastname])
    @title      = 'Banner Details'
    @description = 'Detailed Banner Data'

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @banner }
    end
  end

  def makematch
    #set the isFaculty value to 1 for affiliate
    affiliate = Affiliate.find(params[:id])
    affiliate.isfaculty = 1

    #set the pimd value
    affiliate.pidm = params[:pidm]
    #@affiliate.update_attributes(:pidm => params[:pidm], :isfaculty => 1)

    affiliate.save(validate: false)

    #redirect and show faculty list
    redirect_to affiliates_path
  end

  def removematch
    affiliate = Affiliate.find(params[:id])
    affiliate.isfaculty = 0

    affiliate.pidm = nil

    affiliate.save(validate: false)
    redirect_to affiliates_path
  end


  # # GET /banners/new
  # # GET /banners/new.json
  # def new
  #   @banner = Banner.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @banner }
  #   end
  # end

  # # GET /banners/1/edit
  # def edit
  #   @banner = Banner.find(params[:id])
  # end

  # # POST /banners
  # # POST /banners.json
  # def create
  #   @banner = Banner.new(params[:banner])

  #   respond_to do |format|
  #     if @banner.save
  #       format.html { redirect_to @banner, notice: 'Banner was successfully created.' }
  #       format.json { render json: @banner, status: :created, location: @banner }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @banner.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PUT /banners/1
  # # PUT /banners/1.json
  # def update
  #   @banner = Banner.find(params[:id])

  #   respond_to do |format|
  #     if @banner.update_attributes(params[:banner])
  #       format.html { redirect_to @banner, notice: 'Banner was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @banner.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /banners/1
  # # DELETE /banners/1.json
  # def destroy
  #   @banner = Banner.find(params[:id])
  #   @banner.destroy

  #   respond_to do |format|
  #     format.html { redirect_to banners_url }
  #     format.json { head :no_content }
  #   end
  # end
end

