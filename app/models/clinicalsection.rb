class Clinicalsection < ActiveRecord::Base
  attr_accessible :sectionname

 
  #validates :sectionname, format: { with: /^([a-zA-Z]+\s)*[a-zA-Z]+$/, message: "only allows letters" }
  validates :sectionname, format: { with: /^[A-Za-z\/\\&\s]+$/, message: "only allows letters" } 
end