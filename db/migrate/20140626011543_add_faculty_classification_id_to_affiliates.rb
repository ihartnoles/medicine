class AddFacultyClassificationIdToAffiliates < ActiveRecord::Migration
  def change
  	add_column :affiliates, :faculty_classification_id, :integer
  end
end
