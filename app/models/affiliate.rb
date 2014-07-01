class Affiliate < ActiveRecord::Base
  has_many	:hospitalprivileges
  has_many  :affiliatelanguages
  has_many  :degrees
  has_many  :institutions
  has_many  :residencies
  has_many  :fellowships
  has_many  :certifiedspecialities
  has_many  :affiliatepermissions
  has_many  :banners
  has_many  :assignments
  
  attr_accessible  :faculty_classification_id, :pidm, :path, :isfaculty, :cellphone, :emailfau, :emailoffice, :emailother, :emailpersonal, :emergencyphone, :faxnumber, :firstname, :homecity, :homephone, :homestate, :homestreet, :homezip, :isfaculty, :lastname, :license, :middlename, :officecity, :officestate, :officestreet, :officezip, :otherphonenumber, :prefix, :suffix, :znumber, :officephone, :physiciansgroup, :currentpractice, :teachingavailability

  validates :firstname, length: {minimum: 1, maximum: 50} ,:presence => true
  validates :lastname, length:  {minimum: 1, maximum: 50} ,:presence => true
  validates :license, :presence => true
  validates :homestreet, :presence => true
  validates :homecity, :presence => true
  validates :homestate, :presence => true
  validates :homezip, length:   {minimum: 5}

  

  def getSpecialty(affiliateid)
    specialtyname = Clinicalsection.find(Assignment.where(:affiliate_id => affiliateid).first.clinicalsection_id).sectionname
    return specialtyname 
  end

  def getClassification(classificationid)
    classification = FacultyClassification.find(classificationid).classification
    return classification 
  end

  def facultymember
    self.isfaculty ? "Yes" : "No"
  end

  def results
    @affiliates ||= find_affiliates
  end

  def find_affiliates
    Affiliate.find(:all, :conditions => conditions)
  end

  # def firstname_conditions
  #   ["affiliates.firstname LIKE ?", "%#{firstname}%" , "%#{firstname}%"] unless firstname.blank?
  # end

  # def conditions
  #   [conditions_clauses.join(' AND '), *conditions_options]    
  # end
  
  # def conditions_clauses
  #   conditions_parts.map { |condition| condition.first }
  # end

  # def conditions_options
  #   conditions_parts.map { |condition| condition[1..-1] }.flatten
  # end

  # def conditions_parts
  #   methods.grep(/_conditions$/).map {|m| send(m) }.compact
  # end
end
