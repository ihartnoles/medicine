class Permissiongroup < ActiveRecord::Base
  attr_accessible :groupname, :description, :bits
  has_many	:userpermissions
  has_many	:affiliatepermissions
  has_many	:users
  validates :groupname, :description, :presence => true
end
