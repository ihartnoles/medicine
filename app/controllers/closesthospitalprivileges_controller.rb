class ClosesthospitalprivilegesController < ApplicationController
   
   def create
    @closesthospitalprivilege = Closesthospitalprivilege.new( :hospital_id =>params[:hospital][:id],
    											                                   :affiliate_id => params[:affiliate_id] )

    respond_to do |format|
      if @closesthospitalprivilege.save
        format.html { redirect_to affiliate_path(:id => params[:affiliate_id]), notice: 'Closest hospital privilege was successfully created.' }
        format.json { render json: @closesthospitalprivilege, status: :created, location: @closesthospitalprivilege }
      else
        format.html { render action: "new" }
        format.json { render json: @closesthospitalprivilege.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
   	#find the privilege
    @closesthospitalprivilege = Closesthospitalprivilege.find(params[:id])
    #set the affiliate_id 
    @affiliate_id = @closesthospitalprivilege.affiliate_id
    #destroy the privilege
    @closesthospitalprivilege.destroy

    respond_to do |format|
      format.html { redirect_to affiliate_path(:id => @affiliate_id), notice: 'Closest hospital privilege was successfully deleted.' }
      format.json { head :no_content }
    end
  end

end
