class AddPidMtoAffiliates < ActiveRecord::Migration
 def change
    add_column :affiliates, :pidm, :integer
  end
end
