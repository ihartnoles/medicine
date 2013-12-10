class HospitalprivilegesController < ApplicationController
   
   def create
    @hospitalprivilege = Hospitalprivilege.new( :hospital_id =>params[:hospital][:id],
    											                      :affiliate_id => params[:affiliate_id] )

    respond_to do |format|
      if @hospitalprivilege.save
        format.html { redirect_to affiliate_path(:id => params[:affiliate_id]), notice: 'hospital privilege was successfully created.' }
        format.json { render json: @hospitalprivilege, status: :created, location: @hospitalprivilege }
      else
        format.html { render action: "new" }
        format.json { render json: @hospitalprivilege.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
   	#find the privilege
    @hospitalprivilege = Hospitalprivilege.find(params[:id])
    #set the affiliate_id 
    @affiliate_id = @hospitalprivilege.affiliate_id
    #destroy the privilege
    @hospitalprivilege.destroy

    respond_to do |format|
      format.html { redirect_to affiliate_path(:id => @affiliate_id), notice: 'hospital privilege was successfully deleted.' }
      format.json { head :no_content }
    end
  end

end
