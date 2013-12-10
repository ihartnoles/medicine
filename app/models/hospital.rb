class Hospital < ActiveRecord::Base
  attr_accessible :name
  has_many	:hospitalprivileges
  validates :name, :presence => true
end
