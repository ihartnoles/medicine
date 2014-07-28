class StaticPagesController < ApplicationController
	def faq
		@title      = 'F.A.Q.'
    	@description = 'Frequently Asked Questions'
	end

	def home	
		@title      = 'Home'
    	@description = 'What would you like to do?'		

    	session[:usertype]  = nil
    	session[:usertype]  = User.find_by_username(session[:cas_user]).usertype_id
    	session[:userid] 	= User.find_by_username(session[:cas_user]).id
    	session[:poweruseraccess] = Useraccesslevel.where(:affiliate_id => session[:userid]).pluck(:facultyclassification_id)
    end

	def admin	

		if session[:usertype] != 4
			redirect_to unauthorized_path
		else
			@title      = 'Administration'
    		@description = 'Administrative Panel'		
    	end

	end

	def reports
		@title = 'Reports'
		@description = 'Reporting Options'
	end 

	def unauthorized
		@title = 'Unauthorized'
		@description = ''
	end 
end