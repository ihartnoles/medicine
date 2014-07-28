class AddContractStartEndDatesToContractDates < ActiveRecord::Migration
  def change
    add_column :contract_dates, :contract_start_date,  :string,  :after => :grad_college_end_date
    add_column :contract_dates, :contract_end_date,  :string,  :after => :contract_start_date
  end
end
