class Useraccesslevel < ActiveRecord::Base
  belongs_to :user
  attr_accessible :id, :affiliate_id, :facultyclassification_id
end