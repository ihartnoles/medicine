class CreateAnnualevaluations < ActiveRecord::Migration
  def change
    create_table :annualevaluations do |t|
      t.string :duedate
      t.string :completeddate
      t.integer :evaluator_id
      t.integer :status_id

      t.timestamps
    end
  end
end
