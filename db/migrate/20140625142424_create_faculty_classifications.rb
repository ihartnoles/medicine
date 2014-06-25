class CreateFacultyClassifications < ActiveRecord::Migration
  def change
    create_table :faculty_classifications do |t|
      t.string :classification

      t.timestamps
    end
  end
end
