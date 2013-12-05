class CreateAffiliates < ActiveRecord::Migration
  def change
    create_table :affiliates do |t|
      t.string :znumber
      t.string :prefix
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.string :suffix
      t.string :license

      t.timestamps
    end
  end
end
