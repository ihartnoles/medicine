class Hospital < ActiveRecord::Base
  attr_accessible :name
  has_many	:hospitalprivileges
  validates :name, length: {maximum: 100},:presence => true
end
