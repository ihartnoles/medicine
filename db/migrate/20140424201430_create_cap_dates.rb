class CreateCapDates < ActiveRecord::Migration
  def change
    create_table :cap_dates do |t|
      t.datetime :certificatedate
      t.datetime :statusdate
      t.datetime :meetingdate
      t.integer  :affiliate_id

      t.timestamps
    end
  end
end
