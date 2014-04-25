class CapDate < ActiveRecord::Base
  attr_accessible :affiliate_id, :certificatedate, :meetingdate, :statusdate

  validates :certificatedate, :presence => true
  validates :statusdate, :presence => true
  validates :meetingdate, :presence => true

  #validates_date  :certificatedate
  #validates_date :statusdate
  #validates_date :meetingdate
end
