class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :phone, :username, :usertype_id
  has_many	:userpermissions
  validates :firstname, :lastname, :phone, :username, :usertype_id, :presence => true
end
