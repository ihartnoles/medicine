class CreateDegrees < ActiveRecord::Migration
  def change
    create_table :degrees do |t|
      t.string :degreename
      t.integer :year
      t.integer :institution_id
      t.integer :affiliate_id

      t.timestamps
    end
  end
end
