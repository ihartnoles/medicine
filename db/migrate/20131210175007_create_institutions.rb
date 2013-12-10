class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :institutionname
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
