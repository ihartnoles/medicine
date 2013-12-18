class CreatePermissiongroups < ActiveRecord::Migration
  def change
    create_table :permissiongroups do |t|
      t.string :groupname
      t.string :description
      t.integer :bits

      t.timestamps
    end
  end
end
