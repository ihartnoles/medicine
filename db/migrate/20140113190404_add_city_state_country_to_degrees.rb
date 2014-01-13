class AddCityStateCountryToDegrees < ActiveRecord::Migration
  def change
  	add_column :degrees, :city, :string
  	add_column :degrees, :state, :integer
  	add_column :degrees, :country, :integer 
  end
end
