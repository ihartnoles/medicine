class Permissiongroup < ActiveRecord::Base
  attr_accessible :bits, :description, :groupname
end
