class Disciplinaryaction < ActiveRecord::Base
  attr_accessible :affiliate_id, :date, :disciplinaryaction, :removed, :vetter

  validates :date, :presence => true
  validates :disciplinaryaction, :presence => true
  validates :removed, :presence => true
  validates :vetter, :presence => true
  
end
