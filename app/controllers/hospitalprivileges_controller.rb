class HospitalprivilegesController < ApplicationController
   
   def create
    @hospitalprivilege = Hospitalprivilege.new( :hospital_id =>params[:hospital][:id],
    											:affiliate_id => params[:affiliate_id] )

    respond_to do |format|
      if @hospitalprivilege.save
        format.html { redirect_to affiliate_path, notice: 'hospitalprivilege was successfully created.' }
        format.json { render json: @hospitalprivilege, status: :created, location: @hospitalprivilege }
      else
        format.html { render action: "new" }
        format.json { render json: @hospitalprivilege.errors, status: :unprocessable_entity }
      end
    end
  end

end
