class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :usertype_id
      t.string :firstname
      t.string :lastname
      t.string :phone

      t.timestamps
    end
  end
end
