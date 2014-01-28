class BannerqueuesController < ApplicationController
  # GET /bannerqueues
  # GET /bannerqueues.json
  def index
    @bannerqueues = Bannerqueue.all
    @title      =  'Banner Import Queue'
    @description = 'List of possible matches'


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bannerqueues }
    end
  end

  # GET /bannerqueues/1
  # GET /bannerqueues/1.json
  def show
    @bannerqueue = Bannerqueue.find(params[:id])
    @title       =  'Banner Import Detail'
    @description = 'More details about a specific record'

    @matches     = Affiliate.find_by_lastname(Bannerqueue.find(params[:id]).lastname)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bannerqueue }
    end
  end

  # GET /bannerqueues/new
  # GET /bannerqueues/new.json
  def new
    @bannerqueue = Bannerqueue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bannerqueue }
    end
  end

  # GET /bannerqueues/1/edit
  def edit
    @bannerqueue = Bannerqueue.find(params[:id])
  end

  # POST /bannerqueues
  # POST /bannerqueues.json
  def create
    @bannerqueue = Bannerqueue.new(params[:bannerqueue])

    respond_to do |format|
      if @bannerqueue.save
        format.html { redirect_to @bannerqueue, notice: 'Bannerqueue was successfully created.' }
        format.json { render json: @bannerqueue, status: :created, location: @bannerqueue }
      else
        format.html { render action: "new" }
        format.json { render json: @bannerqueue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bannerqueues/1
  # PUT /bannerqueues/1.json
  def update
    @bannerqueue = Bannerqueue.find(params[:id])

    respond_to do |format|
      if @bannerqueue.update_attributes(params[:bannerqueue])
        format.html { redirect_to @bannerqueue, notice: 'Bannerqueue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bannerqueue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bannerqueues/1
  # DELETE /bannerqueues/1.json
  def destroy
    @bannerqueue = Bannerqueue.find(params[:id])
    @bannerqueue.destroy

    respond_to do |format|
      format.html { redirect_to bannerqueues_url }
      format.json { head :no_content }
    end
  end
end
