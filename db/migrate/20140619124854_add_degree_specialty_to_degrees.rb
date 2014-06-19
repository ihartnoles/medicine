class AddDegreeSpecialtyToDegrees < ActiveRecord::Migration
  def change
    add_column :degrees, :degreespecialty, :string
  end
end
