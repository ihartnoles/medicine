class Affiliateresearcharea < ActiveRecord::Base
  attr_accessible :affiliate_id, :researcharea_id, :researchdescription


  def getResearchAreaName(researcharea_id)
   begin
   	researchAreaName = Researcharea.find(researcharea_id).name
   rescue ActiveRecord::RecordNotFound => e
   	researchAreaName = ''
   end 

   return researchAreaName
  end 
end