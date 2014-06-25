class FacultyClassification < ActiveRecord::Base
  attr_accessible :classification

  validates :classification , :presence => true
end