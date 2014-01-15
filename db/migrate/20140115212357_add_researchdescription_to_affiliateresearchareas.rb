class AddResearchdescriptionToAffiliateresearchareas < ActiveRecord::Migration
  def change
  	add_column :affiliateresearchareas , :researchdescription, :text, :after => :researcharea_id
  end
end
