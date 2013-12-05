class CreateHospitalprivileges < ActiveRecord::Migration
  def change
    create_table :hospitalprivileges do |t|
      t.integer :privilege_id
      t.integer :hospital_id
      t.integer :affiliate_id

      t.timestamps
    end
  end
end
