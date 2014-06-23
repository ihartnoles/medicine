class Assignment < ActiveRecord::Base
  attr_accessible :affiliate_id, :basicsciencediscipline_id, :clinicaldivision_id, :clinicalsection_id, :vetter

   # def getDivision(researcharea_id)
   # 	 researchAreaName = Researcharea.find(researcharea_id).name
  	#  return researchAreaName
   # end 

  def getDivisionName(clinicaldivision_id)
    divisionname = Clinicaldivision.find(clinicaldivision_id).divisionname
    return divisionname
  end

  def getSpecialtyName(clinicalsection_id)
  	specialtyname = Clinicalsection.find(clinicalsection_id).sectionname
    return specialtyname
  end
 
  def getDisciplineName(basicsciencediscipline_id)
    disciplinename = Basicsciencediscipline.find(basicsciencediscipline_id).disciplinename
    return disciplinename
  end

end
