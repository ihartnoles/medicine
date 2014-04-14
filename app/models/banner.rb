class Banner < ActiveRecord::Base
  # attr_accessible :title, :body
  self.abstract_class = true
  self.table_name="FAUMGR.AWP_COM_ALL_EMPS"

  establish_connection(:banner)

  def self.get_objects
    self.find_by_sql("select * from FAUMGR.AWP_COM_ALL_EMPS order by last_name asc")
  end
  
end
