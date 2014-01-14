class CreateContacts < ActiveRecord::Migration
   def change
    create_table :contacts do |t|
      t.string :sentby
      t.string :subject
      t.text   :msg

      t.timestamps
    end
  end
end