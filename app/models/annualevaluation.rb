class Annualevaluation < ActiveRecord::Base
  attr_accessible :completeddate, :duedate, :evaluator_id, :status_id
end
