class CapDate < ActiveRecord::Base
  attr_accessible :affiliate_id, :certificatedate, :meetingdate, :status, :fautitle

  validates :certificatedate, :presence => true
  validates :status, :presence => true
  validates :fautitle, :presence => true

  #validates_date  :certificatedate
  #validates_date :statusdate
  #validates_date :meetingdate

  def getStatusName(status_id)
  	statusname = Capstatus.find(status_id).status
    return statusname
  end
  
  def getFacultyTitle(titleid)
    return Facultytitle.find(titleid).title
  end
end
