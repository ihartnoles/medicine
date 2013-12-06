class Affiliate < ActiveRecord::Base
  set_primary_key 'affiliate_id'
  has_many	:hospitalprivileges
  has_many  :affiliatelanguages
  attr_accessible :znumber, :prefix, :firstname, :middlename, :lastname, :suffix, :license
  validates :firstname, :lastname, :presence => true
end
