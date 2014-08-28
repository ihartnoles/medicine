class Degree < ActiveRecord::Base
  #has_and_belongs_to_many :institutions
  attr_accessible :affiliate_id, :degreelist_id, :institution_id, :year, :city, :state, :country, :degreespecialty

  validates :degreelist_id, :presence => true
  validates :year, :presence => true
  validates :institution_id, :presence => true
  #validates :city,  format: { with: /^[A-Za-z\s]+$/, message: "only allows letters" } ,:presence => true
  #validates :state, :presence => true
  #validates :country, :presence => true
  #validates :degreespecialty, :presence => true

  def getDegreeName(degreelist_id)
  	degreename = Degreelist.find(degreelist_id).degreename
    return degreename
  end

  def getInstitutionName(institution_id)
  	institutionname = Institution.find(institution_id).institutionname
    return institutionname
  end

  def getStateName(state_id)
  	statename = State.find(state_id).state
    return statename
  end

  def getCountryName(country_id)
  	countryname = Country.find(country_id).country
    return countryname
  end
end
