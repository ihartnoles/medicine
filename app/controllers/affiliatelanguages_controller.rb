class AffiliatelanguagesController < ApplicationController
   
   def create
    
    params[:languages][:language_ids].each do | i |
      @affiliatelanguage = Affiliatelanguage.new(:language_id => i,
    											                       :affiliate_id => params[:affiliate_id])
      @affiliatelanguage.save
    end 

    respond_to do |format|
     if @affiliatelanguage.save
        format.html { redirect_to affiliate_path(:id => params[:affiliate_id]), notice: 'affiliate language was successfully created.' }
        format.json { render json: @affiliatelanguage, status: :created, location: @affiliatelanguage }
      else
        format.html { render action: "new" }
        format.json { render json: @affiliatelanguage.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
   	#find the privilege
    @affiliatelanguage = Affiliatelanguage.find(params[:id])
    #set the affiliate_id 
    @affiliate_id = @affiliatelanguage.affiliate_id
    #destroy the privilege
    @affiliatelanguage.destroy

    respond_to do |format|
      format.html { redirect_to affiliate_path(:id => @affiliate_id), notice: 'affiliate language was successfully deleted.' }
      format.json { head :no_content }
    end
  end

end
