class AddAffiliateIdToFellowships < ActiveRecord::Migration
  def change
    add_column :fellowships, :affiliate_id, :integer
  end
end
