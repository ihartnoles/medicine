class CreateCvs < ActiveRecord::Migration
  def change
    create_table :cvs do |t|
      t.integer :affiliate_id
      t.string :path

      t.timestamps
    end
  end
end
