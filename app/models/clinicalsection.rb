class Clinicalsection < ActiveRecord::Base
  attr_accessible :sectionname, :division_id

 
  #validates :sectionname, format: { with: /^([a-zA-Z]+\s)*[a-zA-Z]+$/, message: "only allows letters" }
  validates :sectionname, format: { with: /^[A-Za-z\/\\&\s]+$/, message: "only allows letters" } 

   def getDivisionName(clinicaldivision_id)
    begin
    	divisionname = Clinicaldivision.find(clinicaldivision_id).divisionname
    rescue ActiveRecord::RecordNotFound => e
    	divisionname = ''
    end 
    
    return divisionname
  end
  
end