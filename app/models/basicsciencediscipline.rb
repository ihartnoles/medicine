class Basicsciencediscipline < ActiveRecord::Base
  #self.primary_key = "discipline_id"
  attr_accessible :discipline_id, :disciplinename

  validates :disciplinename, format: { with: /^([a-zA-Z]+\s)*[a-zA-Z]+$/, message: "only allows letters" }
end
