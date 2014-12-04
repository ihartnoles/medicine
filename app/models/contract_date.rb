class ContractDate < ActiveRecord::Base
  attr_accessible :affiliate_id, :grad_college_end_date, :grad_college_start_date  , :contract_start_date, :contract_end_date
  validates :affiliate_id , :contract_start_date, :contract_end_date, :presence => true
end
