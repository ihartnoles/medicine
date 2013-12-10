class Affiliate < ActiveRecord::Base
  has_many	:hospitalprivileges
  has_many  :affiliatelanguages
  has_many  :degrees
  has_many  :institutions
  has_many  :residencies
  has_many  :fellowships
  has_many  :certifiedspecialties
  attr_accessible :cellphone, :emailfau, :emailoffice, :emailother, :emailpersonal, :emergencyphone, :faxnumber, :firstname, :homecity, :homephone, :homestate, :homestreet, :homezip, :isfaculty, :lastname, :license, :middlename, :officecity, :officestate, :officestreet, :officezip, :otherphonenumber, :prefix, :suffix, :znumber
end
