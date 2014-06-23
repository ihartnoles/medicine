class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :affiliate_id
      t.integer :clinicaldivision_id
      t.integer :clinicalsection_id
      t.integer :basicsciencediscipline_id
      t.string :vetter

      t.timestamps
    end
  end
end
