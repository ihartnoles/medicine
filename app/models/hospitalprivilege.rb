class Hospitalprivilege < ActiveRecord::Base
   set_primary_key 'privilege_id'
   belongs_to :affiliate
   belongs_to :hospital
   attr_accessible :affiliate_id, :hospital_id, :privilege_id
end
