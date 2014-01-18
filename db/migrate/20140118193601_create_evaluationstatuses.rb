class CreateEvaluationstatuses < ActiveRecord::Migration
  def change
    create_table :evaluationstatuses do |t|
      t.text :status

      t.timestamps
    end
  end
end
