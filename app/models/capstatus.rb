class Capstatus < ActiveRecord::Base
  attr_accessible :status
  validates :status, :presence => true

  has_many  :capdates

  def getStatusName(status_id)
  	begin
  	  statusname = Capstatus.find(status_id).status
  	rescue ActiveRecord::RecordNotFound => e
      statusname = ''
    end 
    return statusname
  end
end
