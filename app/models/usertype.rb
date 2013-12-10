class Usertype < ActiveRecord::Base
  attr_accessible :description, :usertype
  belongs_to :user
  validates :description, :usertype, :presence => true
end
