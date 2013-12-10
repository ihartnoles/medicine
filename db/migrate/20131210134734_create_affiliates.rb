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
      t.string :homestreet
      t.string :homecity
      t.string :homestate
      t.integer :homezip
      t.string :officestreet
      t.string :officecity
      t.string :officestate
      t.integer :officezip
      t.string :homephone
      t.string :cellphone
      t.string :emergencyphone
      t.string :faxnumber
      t.string :otherphonenumber
      t.string :emailfau
      t.string :emailpersonal
      t.string :emailoffice
      t.string :emailother
      t.boolean :isfaculty

      t.timestamps
    end
  end
end
