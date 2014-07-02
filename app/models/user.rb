class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :phone, :username, :usertype_id
  has_many	:userpermissions
  has_many	:permissiongroups
  validates :firstname, :lastname,:username, :usertype_id, :presence => true


  def groupname(id)
  	name = Permissiongroup.find(id).groupname

  	return name
  end

end
