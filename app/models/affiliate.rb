class Affiliate < ActiveRecord::Base
  has_many	:hospitalprivileges
  has_many  :affiliatelanguages
  has_many  :degrees
  has_many  :institutions
  has_many  :residencies
  has_many  :fellowships
  has_many  :certifiedspecialties
  has_many  :affiliatepermissions
  attr_accessible :isfaculty, :cellphone, :emailfau, :emailoffice, :emailother, :emailpersonal, :emergencyphone, :faxnumber, :firstname, :homecity, :homephone, :homestate, :homestreet, :homezip, :isfaculty, :lastname, :license, :middlename, :officecity, :officestate, :officestreet, :officezip, :otherphonenumber, :prefix, :suffix, :znumber

  validates :firstname, length: {minimum: 1, maximum: 50} ,:presence => true
  validates :lastname, length:  {minimum: 1, maximum: 50} ,:presence => true
  validates :homezip, length:   {minimum: 5}

  def facultymember
    self.isfaculty ? "Yes" : "No"
  end
end
