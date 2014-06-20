class CreateAppointmentDates < ActiveRecord::Migration
  def change
    create_table :appointment_dates do |t|
      t.integer :affiliate_id
      t.string :com_start_date

      t.timestamps
    end
  end
end
