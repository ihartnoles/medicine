class LanguagesController < ApplicationController
  # GET /languages
  # GET /languages.json
  def index

    if session[:usertype] != 4
      #redirect_to unauthorized_path
      unauthorized = 1
    end

    @languages = Language.all
    @title      = 'Language List'
    @description = 'Language options in the system'
    if unauthorized == 1
        redirect_to unauthorized_path
    else

      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @languages }
      end
    end
    
  end

  # GET /languages/1
  # GET /languages/1.json
  def show
    @language = Language.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @language }
    end
  end

  # GET /languages/new
  # GET /languages/new.json
  def new
    @language = Language.new
    @title      = 'New Language'
    @description = 'Add a new language option to the system'
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @language }
    end
  end

  # GET /languages/1/edit
  def edit
    @language = Language.find(params[:id])
    @title      = 'Edit Language'
    @description = 'Edit a new language option to the system'
  end

  # POST /languages
  # POST /languages.json
  def create
    @language = Language.new(params[:language])

    respond_to do |format|
      if @language.save
        format.html { redirect_to languages_path, notice: 'Language was successfully created.' }
        format.json { render json: @language, status: :created, location: @language }
      else
        format.html { render action: "new" }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /languages/1
  # PUT /languages/1.json
  def update
    @language = Language.find(params[:id])

    respond_to do |format|
      if @language.update_attributes(params[:language])
        format.html { redirect_to @language, notice: 'Language was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    @language = Language.find(params[:id])
    @language.destroy

    respond_to do |format|
      format.html { redirect_to languages_url , notice: 'Language was successfully deleted.'  }
      format.json { head :no_content }
    end
  end
end
