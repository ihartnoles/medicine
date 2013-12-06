class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.integer :language_id
      t.string :language
      t.string :abbreviation

      t.timestamps
    end
  end
end
