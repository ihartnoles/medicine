class ContractDate < ActiveRecord::Base
  attr_accessible :affiliate_id, :grad_college_end_date, :grad_college_start_date
  validates :affiliate_id, :grad_college_end_date, :grad_college_start_date , :presence => true
end
