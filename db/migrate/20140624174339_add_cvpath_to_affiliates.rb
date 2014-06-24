class AddCvpathToAffiliates < ActiveRecord::Migration
  def change
    add_column :affiliates, :path, :string
  end
end
