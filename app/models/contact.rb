class Contact < ActiveRecord::Base
  attr_accessible :sentby, :subject, :msg
  
  validates :sentby,  :presence => true
  validates :subject, length: {maximum: 50},:presence => true
  validates :msg, 	  length: {maximum: 255},:presence => true
end
