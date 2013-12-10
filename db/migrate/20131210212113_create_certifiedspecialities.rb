class CreateCertifiedspecialities < ActiveRecord::Migration
  def change
    create_table :certifiedspecialities do |t|
      t.integer :affiliate_id
      t.integer :speciality_id
      t.integer :year

      t.timestamps
    end
  end
end
