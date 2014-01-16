class Affiliateresearcharea < ActiveRecord::Base
  attr_accessible :affiliate_id, :researcharea_id, :researchdescription


  def getResearchAreaName(researcharea_id)
   researchAreaName = Researcharea.find(researcharea_id).name
   return researchAreaName
  end 
end