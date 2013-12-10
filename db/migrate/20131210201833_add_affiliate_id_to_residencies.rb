class AddAffiliateIdToResidencies < ActiveRecord::Migration
  def change
    add_column :residencies, :affiliate_id, :integer
  end
end
