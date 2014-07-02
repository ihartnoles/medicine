class StaticPagesController < ApplicationController
	def faq
		@title      = 'F.A.Q.'
    	@description = 'Frequently Asked Questions'
	end

	def home	
		@title      = 'Home'
    	@description = 'What would you like to do?'		
    	session[:usertype] = User.find_by_username(session[:cas_user]).usertype_id
	end

	def admin	
		@title      = 'Administration'
    	@description = 'Administrative Panel'		
	end

	def reports
		@title = 'Reports'
		@description = 'Reporting Options'
	end 
end