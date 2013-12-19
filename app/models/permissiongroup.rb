class Permissiongroup < ActiveRecord::Base
  attr_accessible :groupname, :description, :bits
  has_many	:userpermissions
  has_many	:affiliatepermissions
  validates :groupname, :description, :presence => true
end
