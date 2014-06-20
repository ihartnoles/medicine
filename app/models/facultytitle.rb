class Facultytitle < ActiveRecord::Base
  attr_accessible :title

  validates :title, format: { with: /^([a-zA-Z]+\s)*[a-zA-Z]+$/, message: "only allows letters" }
end
