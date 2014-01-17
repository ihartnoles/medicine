class RenameDegreenameToDegreeId < ActiveRecord::Migration
   def change
  	rename_column :degrees, :degreename, :degreelist_id  	
  end
end
