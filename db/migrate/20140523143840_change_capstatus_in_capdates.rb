class ChangeCapstatusInCapdates < ActiveRecord::Migration
  def change
   change_column :cap_dates, :statusdate, :string
   rename_column :cap_dates, :statusdate, :status
  end
end
