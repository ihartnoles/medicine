class Affiliatepermission < ActiveRecord::Base
   belongs_to :affiliate
   belongs_to :permissiongroup
  attr_accessible :affiliate_id, :permissionid
end
