class CreateCapstatuses < ActiveRecord::Migration
  def change
    create_table :capstatuses do |t|
      t.string :status
      t.timestamps
    end
  end
end
