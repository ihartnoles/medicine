class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :state
      t.string :abbreviation

      t.timestamps
    end
  end
end
