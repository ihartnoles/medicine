class Residency < ActiveRecord::Base
  attr_accessible :location, :matchconnection, :specialty_id, :trainingtitle

  validates :location, :presence => true
  validates :specialty_id, :presence => true
  validates :trainingtitle, :presence => true
  validates :matchconnection, :presence => true
  
  def getSpecialtyName(speciality_id)
  	specialtyname = Clinicalsection.find(speciality_id).sectionname
    return specialtyname
  end
end
