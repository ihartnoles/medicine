class Assignment < ActiveRecord::Base
  attr_accessible :affiliate_id, :basicsciencediscipline_id, :clinicaldivision_id, :clinicalsection_id, :vetter

   # def getDivision(researcharea_id)
   # 	 researchAreaName = Researcharea.find(researcharea_id).name
  	#  return researchAreaName
   # end 

  def getDivisionName(clinicaldivision_id)
    begin
      divisionname = Clinicaldivision.find(clinicaldivision_id).divisionname
    rescue ActiveRecord::RecordNotFound => e
      divisionname = ''
    end
    return divisionname
  end

  def getSpecialtyName(clinicalsection_id)
  	begin
      specialtyname = Clinicalsection.find(clinicalsection_id).sectionname
    rescue ActiveRecord::RecordNotFound => e
      specialtyname = ''
    end 

    return specialtyname
  end
 
  def getDisciplineName(basicsciencediscipline_id)
    begin
      disciplinename = Basicsciencediscipline.find(basicsciencediscipline_id).disciplinename
    rescue ActiveRecord::RecordNotFound => e
      disciplinename = ''
    end 

    return disciplinename
  end

end
