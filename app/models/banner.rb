class Banner < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many  :affiliates

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


  def self.find_by_id(pidm)
      record = self.find_by_sql(["select * from FAUMGR.AWP_COM_ALL_EMPS  where pidm = :pidm ", {:pidm => pidm }])

      return record
  end

  def self.find_matches(lastname)
      self.find_by_sql(["select 
                            pidm,
                            zid, 
                            fau_netid, 
                            first_name, 
                            last_name, 
                            email, 
                            birth_date, 
                            hm_street_line1,
                            hm_city,
                            hm_state,
                            hm_zip,
                            hm_phone,
                            primary_job_start_date,
                            nbrjobs_ann_salary,
                            last_incr_date,
                            working_title,
                            nbbposn_title,
                            perbfac_academic_title,
                            supervisor_title
                        from FAUMGR.AWP_COM_ALL_EMPS  
                        where last_name = :last ", {:last => lastname }])
  end
  
end