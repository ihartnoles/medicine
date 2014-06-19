class CreateClinicalsections < ActiveRecord::Migration
  def change
    create_table :clinicalsections do |t|
      t.string :sectionname

      t.timestamps
    end
  end
end
