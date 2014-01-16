class Researcharea < ActiveRecord::Base
  attr_accessible :name

  has_many	:researchareas
end
