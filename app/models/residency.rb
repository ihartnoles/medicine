class Residency < ActiveRecord::Base
  attr_accessible :location, :matchconnection, :specialty_id, :trainingtitle

  validates :location, :presence => true
  validates :specialty_id, :presence => true
  #validates :trainingtitle, :presence => true
  #validates :matchconnection, :presence => true
  
  def getSpecialtyName(speciality_id)
  	begin
  		specialtyname = Clinicalsection.find(speciality_id).sectionname
  	rescue ActiveRecord::RecordNotFound => e
  		specialtyname = ''
  	end
    return specialtyname
  end
end
