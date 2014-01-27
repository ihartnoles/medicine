class AffiliatelanguagesController < ApplicationController
   
   def create
    
      #clear out any existing in database
      @findExistingLang = Affiliatelanguage.where('affiliate_id' => params[:affiliate_id]).destroy_all
                        
        #loop over selections and save
        if params.has_key?("languages")
          params[:languages][:language_ids].each do | i |          
              @affiliatelanguage = Affiliatelanguage.new(:language_id => i,
          											                         :affiliate_id => params[:affiliate_id])
              @affiliatelanguage.save
          end

           respond_to do |format|
           if @affiliatelanguage.save
              format.html { redirect_to affiliate_path(:id => params[:affiliate_id]), notice: 'Language preference added!' }
              #format.json { render json: @affiliatelanguage, status: :created, location: @affiliatelanguage }
            else
              format.html { redirect_to affiliate_path(:id => params[:affiliate_id]), notice: 'Oops! There was a problem. Please try again.' }
            end
        end

        #no checkboxes checked
        else
            respond_to do |format|
              format.html { redirect_to affiliate_path(:id => params[:affiliate_id]), notice: 'Language preference updated!' }
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
      format.html { redirect_to affiliate_path(:id => @affiliate_id), notice: 'Language was successfully deleted.' }
      format.json { head :no_content }
    end
  end

end
