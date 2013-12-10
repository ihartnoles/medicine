class CreateUsertypes < ActiveRecord::Migration
  def change
    create_table :usertypes do |t|
      t.string :usertype
      t.text :description

      t.timestamps
    end
  end
end
