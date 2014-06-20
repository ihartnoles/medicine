class CreateContractDates < ActiveRecord::Migration
  def change
    create_table :contract_dates do |t|
      t.integer :affiliate_id
      t.string :grad_college_start_date
      t.string :grad_college_end_date

      t.timestamps
    end
  end
end
