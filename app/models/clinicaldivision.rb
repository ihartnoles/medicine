class Clinicaldivision < ActiveRecord::Base
  has_many  :clincalsections
  attr_accessible :id, :divisionname
end
