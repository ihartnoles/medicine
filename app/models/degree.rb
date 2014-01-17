class Degree < ActiveRecord::Base
  #has_and_belongs_to_many :institutions
  attr_accessible :affiliate_id, :degreename, :institution_id, :year, :city, :state, :country

  validates :year, :presence => true
  validates :institution_id, :presence => true
  validates :city,  format: { with: /^[A-Za-z\s]+$/, message: "only allows letters" } ,:presence => true
  validates :state, :presence => true
  validates :country, :presence => true
end
