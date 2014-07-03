class License < ActiveRecord::Base
  attr_accessible :affiliate_id, :licensenumber, :state, :status, :year


  def getStateName(state_id)
  	return State.find(state_id).state
  end

end
