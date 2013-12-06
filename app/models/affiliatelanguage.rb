class Affiliatelanguage < ActiveRecord::Base
  belongs_to :language
  belongs_to :affiliates
  attr_accessible :id, :affiliate_id, :language_id
end
