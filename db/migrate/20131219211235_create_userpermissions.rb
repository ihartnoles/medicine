class CreateUserpermissions < ActiveRecord::Migration
  def change
    create_table :userpermissions do |t|
      t.integer :userid
      t.integer :permissionid

      t.timestamps
    end
  end
end
