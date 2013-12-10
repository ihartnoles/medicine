class Institution < ActiveRecord::Base
  has_many :affiliateinstitutions
  attr_accessible :city, :country, :institutionname, :state
end
