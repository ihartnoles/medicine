class Banner < ActiveRecord::Base
  # attr_accessible :title, :body
  self.abstract_class = true
  self.table_name="FAUMGR.AWP_COM_ALL_EMPS"

  establish_connection(:banner)

  def self.get_objects
    self.find_by_sql("select * from FAUMGR.AWP_COM_ALL_EMPS order by last_name asc")
  end

  def self.find_by_lastname(lastname)
  	 tmp = self.find_by_sql(["select * from FAUMGR.AWP_COM_ALL_EMPS  where last_name = :last ", {:last => lastname }])

  	if tmp.count > 0
  		return true
  	else 
  		return false
  	end 
  end
  
end