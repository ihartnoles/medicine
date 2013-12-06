class CreateAffiliatelanguages < ActiveRecord::Migration
  def change
    create_table :affiliatelanguages do |t|

      t.timestamps
    end
  end
end
