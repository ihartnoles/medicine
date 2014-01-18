class AddAffiliateIdToEvaluationstatuses < ActiveRecord::Migration
  def change
  	add_column :annualevaluations , :affiliate_id, :integer, :after => :id
  end
end
