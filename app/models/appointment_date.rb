class AppointmentDate < ActiveRecord::Base
  attr_accessible :affiliate_id, :com_start_date

  validates :affiliate_id, :com_start_date, :presence => true
end
