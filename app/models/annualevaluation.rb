class Annualevaluation < ActiveRecord::Base
  attr_accessible :completeddate, :duedate, :evaluator, :status_id

  validates :completeddate, :presence => true
  validates :duedate, :presence => true
  validates :evaluator, :presence => true
  #validates :status_id, :presence => true


  def getEvaluatorName(evaluator_id)
  	begin 
      evaluatorname = User.find(evaluator_id).username
    rescue ActiveRecord::RecordNotFound => e
      evaluatorname = ''
    end 

    return evaluatorname
  end

  def getStatus(status_id)
  	begin
      status = Evaluationstatus.find(status_id).status
    rescue ActiveRecord::RecordNotFound => e
      status = ''
    end
    
    return status
  end


end
