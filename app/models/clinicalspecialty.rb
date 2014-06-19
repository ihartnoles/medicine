class Clinicalspecialty < ActiveRecord::Base
  attr_accessible :affiliate_id, :speciality_id, :year, :basicsciencediscipline_id

  belongs_to	:clinicalsection
  belongs_to  :affiliate
  
  has_many :basicsciencedisciplines

  validates :affiliate_id, length: {minimum: 1},:presence => true
  validates :speciality_id,:presence => true
  validates :basicsciencediscipline_id,:presence => true
  validates :year, length: {is: 4},:presence => true

  def getSpecialtyName(speciality_id)
  	specialtyname = Clinicalsection.find(speciality_id).sectionname
    return specialtyname
  end
 
 def getDisciplineName(basicsciencediscipline_id)
    disciplinename = Basicsciencediscipline.find(basicsciencediscipline_id).disciplinename
    return disciplinename
  end

end
