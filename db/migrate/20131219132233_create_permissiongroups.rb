class CreatePermissiongroups < ActiveRecord::Migration
  def change
    create_table :permissiongroups do |t|

      t.timestamps
    end
  end
end
