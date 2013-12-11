class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string  :permissiontype
      t.string  :description
      t.integer :bits

      t.timestamps
    end
  end
end
