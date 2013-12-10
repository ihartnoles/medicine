class CreateFellowships < ActiveRecord::Migration
  def change
    create_table :fellowships do |t|
      t.string :specialty
      t.string :location
      t.string :training

      t.timestamps
    end
  end
end
