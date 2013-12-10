class License < ActiveRecord::Base
  attr_accessible :affiliate_id, :licensenumber, :state, :status, :year
end
