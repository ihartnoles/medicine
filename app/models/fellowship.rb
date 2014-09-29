class Fellowship < ActiveRecord::Base
  
  attr_accessible :location, :specialty_id, :training

  validates :location, :presence => true
  validates :specialty_id, :presence => true
  validates :training, :presence => true

  def getSpecialtyName(speciality_id)
  	begin
  		specialtyname = Clinicalsection.find(speciality_id).sectionname
  	rescue ActiveRecord::RecordNotFound => e
  		specialtyname = ''
  	end
  	
    return specialtyname
  end
  
end
