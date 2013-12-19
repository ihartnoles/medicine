class CreateAffiliatepermissions < ActiveRecord::Migration
  def change
    create_table :affiliatepermissions do |t|
      t.integer :affiliate_id
      t.integer :permissionid

      t.timestamps
    end
  end
end
