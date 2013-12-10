class CreateLicenses < ActiveRecord::Migration
  def change
    create_table :licenses do |t|
      t.integer :affiliate_id
      t.string :licensenumber
      t.string :state
      t.integer :year
      t.string :status

      t.timestamps
    end
  end
end
