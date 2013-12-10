class Clinicalsection < ActiveRecord::Base
  has_many  :residencies
  has_many  :fellowships
  has_many  :certifiedspecialties
  attr_accessible :sectionname, :division_id
end
