class Userpermission < ActiveRecord::Base
   belongs_to :user
   belongs_to :permissiongroup
  attr_accessible :permissionid, :userid
end
