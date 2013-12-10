class CreateAffiliateinstitutions < ActiveRecord::Migration
  def change
    create_table :affiliateinstitutions do |t|
      t.integer :affiliate_id
      t.integer :institution_id

      t.timestamps
    end
  end
end
