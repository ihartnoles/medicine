class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :phone, :username, :usertype_id, :access
  has_many	:userpermissions
  has_many	:permissiongroups
  has_many  :useraccesslevels
  validates :firstname, :lastname,:username, :usertype_id, :presence => true


  def groupname(id)
  	name = Permissiongroup.find(id).groupname

  	return name
  end


  def hasAccess(userid, faculty_classification_id )
    return Useraccesslevel.find_by_sql(["select facultyclassification_id from useraccesslevels  where affiliate_id = :affiliate_id AND facultyclassification_id = :faculty_classification_id", {:affiliate_id => userid , :faculty_classification_id =>  faculty_classification_id}])
  end

  def getPowerUserAccess(userid)
  	 return Useraccesslevel.find_by_sql(["select facultyclassification_id from useraccesslevels  where affiliate_id = :affiliate_id", {:affiliate_id => userid}])
  end
  
end
