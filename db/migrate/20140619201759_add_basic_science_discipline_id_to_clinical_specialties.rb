class AddBasicScienceDisciplineIdToClinicalSpecialties < ActiveRecord::Migration
  def change
  	add_column :clinicalspecialties, :basicsciencediscipline_id, :integer , after: :affiliate_id
  end
end
