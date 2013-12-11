class User < ActiveRecord::Base
  attr_accessible :firstname, :lastname, :phone, :username, :usertype_id
  has_many	:permissions
  validates :firstname, :lastname, :phone, :username, :usertype_id, :presence => true
end
