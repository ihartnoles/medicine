class RenameSpecialtyToSpecialityId < ActiveRecord::Migration
  def change
  	rename_column :fellowships, :specialty, :specialty_id
  	rename_column :residencies, :specialty, :specialty_id
  end
end
