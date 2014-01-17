class Degree < ActiveRecord::Base
  #has_and_belongs_to_many :institutions
  attr_accessible :affiliate_id, :degreename, :institution_id, :year

  validates :year, :presence => true
  validates :institution_id, :presence => true
end
