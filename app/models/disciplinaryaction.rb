class Disciplinaryaction < ActiveRecord::Base
  attr_accessible :affiliate_id, :date, :disciplinaryaction, :removed, :vetter

  validates :date, :presence => true
  validates :disciplinaryaction, :presence => true
  validates :removed, :presence => true
  validates :vetter, format: { with: /^([a-zA-Z]+\s)*[a-zA-Z]+$/, message: "only allows letters" }
end
