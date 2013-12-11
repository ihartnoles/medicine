class Permission < ActiveRecord::Base
  has_many :users
  attr_accessible :bits, :description, :permissiontype
end
