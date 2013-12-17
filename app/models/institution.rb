class Institution < ActiveRecord::Base
  has_many :affiliateinstitutions
  attr_accessible :city, :country, :institutionname, :state
  validates :institutionname, length: {maximum: 100},:presence => true
end
