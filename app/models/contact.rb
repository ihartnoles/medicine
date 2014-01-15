class Contact < ActiveRecord::Base
  attr_accessible :sentby, :subject, :msg
   
  validates :subject, length: {minimum: 1, maximum: 50}
  validates :msg, 	  length: {minimum: 1, maximum: 255}
end
