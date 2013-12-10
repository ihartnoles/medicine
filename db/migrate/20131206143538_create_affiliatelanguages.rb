class CreateAffiliatelanguages < ActiveRecord::Migration
  def change
    create_table :affiliatelanguages do |t|
      t.integer :affiliate_id
      t.integer :language_id
      t.timestamps
    end
  end
end
