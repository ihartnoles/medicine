class CreateFacultyDates < ActiveRecord::Migration
  def change
    create_table :faculty_dates do |t|
      t.datetime :overloadstart
      t.datetime :overloadend
      t.integer  :affiliate_id
      
      t.timestamps
    end
  end
end
