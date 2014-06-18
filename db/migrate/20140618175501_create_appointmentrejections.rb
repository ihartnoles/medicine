class CreateAppointmentrejections < ActiveRecord::Migration
  def change
    create_table :appointmentrejections do |t|
      t.string :vetter
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
