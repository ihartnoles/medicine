class CreateResearchareas < ActiveRecord::Migration
  def change
    create_table :researchareas do |t|
      t.string :name

      t.timestamps
    end
  end
end
