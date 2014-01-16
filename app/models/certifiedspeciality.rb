class Certifiedspeciality < ActiveRecord::Base
  attr_accessible :affiliate_id, :speciality_id, :year

  belongs_to	:clinicalsection
  
  validates :affiliate_id, length: {minimum: 1},:presence => true
  validates :speciality_id, length: {minimum: 1},:presence => true
  validates :year, length: {is: 4},:presence => true

  def getSpecialtyName(speciality_id)
  	specialtyname = Clinicalsection.find(speciality_id).sectionname
    return specialtyname
  end


end
