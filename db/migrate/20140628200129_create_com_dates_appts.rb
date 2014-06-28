class CreateComDatesAppts < ActiveRecord::Migration
  def change
    create_table :com_dates_appts do |t|
      t.string :affiliate_id
      t.string :position_title
      t.string :position_start_date
      t.string :position_end_date
      t.string :academic_title
      t.string :academic_start_date
      t.string :position_end_date
      t.string :admin1_title
      t.string :admin1_start_date
      t.string :admin1_end_date
      t.string :admin2_title
      t.string :admin2_start_date
      t.string :admin2_end_date
      t.string :admin3_title
      t.string :admin3_start_date
      t.string :admin3_end_date
      t.string :positiontrack
      t.string :workingtitle

      t.timestamps
    end
  end
end
