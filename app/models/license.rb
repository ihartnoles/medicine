class License < ActiveRecord::Base
  attr_accessible :affiliate_id, :licensenumber, :state, :status, :year


  def getStateName(state_id)
  	begin
  		statename = State.find(state_id).state
  	rescue ActiveRecord::RecordNotFound => e
  		statename = ''
  	end 

  	return statename 
  end

end
