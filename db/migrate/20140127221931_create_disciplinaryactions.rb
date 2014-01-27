class CreateDisciplinaryactions < ActiveRecord::Migration
  def change
    create_table :disciplinaryactions do |t|
      t.integer :affiliate_id
      t.string :disciplinaryaction
      t.string :removed
      t.string :date

      t.timestamps
    end
  end
end
