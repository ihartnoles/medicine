class CreateDegreelists < ActiveRecord::Migration
  def change
    create_table :degreelists do |t|
      t.string :degreename

      t.timestamps
    end
  end
end
