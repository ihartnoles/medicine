class CapDate < ActiveRecord::Base
  attr_accessible :affiliate_id, :certificatedate, :meetingdate, :status, :fautitle

  #validates :certificatedate, :meetingdate, :presence => true
  #validates :status, :presence => true
  #validates :fautitle, :presence => true

  #validates_date  :certificatedate
  #validates_date :statusdate
  #validates_date :meetingdate

  def getStatusName(status_id)
  	begin
      statusname = Capstatus.find(status_id).status
    rescue ActiveRecord::RecordNotFound => e
      statusname = ''
    end 
    return statusname
  end
  
  def getFacultyTitle(titleid)
    begin
      return Facultytitle.find(titleid).title
    rescue ActiveRecord::RecordNotFound => e
      return ''
    end 
  end
end
