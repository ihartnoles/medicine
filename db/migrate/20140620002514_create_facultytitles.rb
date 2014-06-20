class CreateFacultytitles < ActiveRecord::Migration
  def change
    create_table :facultytitles do |t|
      t.string :title

      t.timestamps
    end
  end
end
