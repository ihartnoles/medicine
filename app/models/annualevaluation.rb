class Annualevaluation < ActiveRecord::Base
  attr_accessible :completeddate, :duedate, :evaluator_id, :status_id

  validates :completeddate, :presence => true
  validates :duedate, :presence => true
  validates :evaluator_id, :presence => true
  validates :status_id, :presence => true


  def getEvaluatorName(evaluator_id)
  	evaluatorname = User.find(evaluator_id).username
    return evaluatorname
  end

  def getStatus(status_id)
  	status = Evaluationstatus.find(status_id).status
    return status
  end


end
