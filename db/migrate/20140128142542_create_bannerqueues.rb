class CreateBannerqueues < ActiveRecord::Migration
  def change
    create_table :bannerqueues do |t|
      t.string :faunetid
      t.string :znumber
      t.string :suffix
      t.string :firstname
      t.string :lastname
      t.string :dob
      t.string :emailfau
      t.string :homestreet
      t.string :homecity
      t.string :homestate
      t.integer :homezip

      t.timestamps
    end
  end
end
