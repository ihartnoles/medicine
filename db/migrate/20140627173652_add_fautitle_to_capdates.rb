class AddFautitleToCapdates < ActiveRecord::Migration
  def change
    add_column :cap_dates, :fautitle, :string  
  end
end
