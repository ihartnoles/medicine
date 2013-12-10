class CreateAffiliateresearchareas < ActiveRecord::Migration
  def change
    create_table :affiliateresearchareas do |t|
      t.integer :researcharea_id
      t.integer :affiliate_id

      t.timestamps
    end
  end
end
