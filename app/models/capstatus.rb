class Capstatus < ActiveRecord::Base
  attr_accessible :status
  validates :status, :presence => true

  has_many  :capdates

  def getStatusName(status_id)
  	statusname = Capstatus.find(status_id).status
    return statusname
  end
end
