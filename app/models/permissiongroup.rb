class Permissiongroup < ActiveRecord::Base
  attr_accessible :groupname, :description, :bits
  validates :groupname, :description, :presence => true
end
