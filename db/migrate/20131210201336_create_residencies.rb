class CreateResidencies < ActiveRecord::Migration
  def change
    create_table :residencies do |t|
      t.string :specialty
      t.string :location
      t.string :trainingtitle
      t.string :matchconnection

      t.timestamps
    end
  end
end
