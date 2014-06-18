class Appointmentrejection < ActiveRecord::Base
  attr_accessible  :affiliate_id, :vetter, :date, :status
  
  validates :date,   :presence => true
  validates :status, :presence => true
  validates :vetter, format: { with: /^([a-zA-Z]+\s)*[a-zA-Z]+$/, message: "only allows letters" }
end