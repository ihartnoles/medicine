class StaticPagesController < ApplicationController
	def faq
		@title      = 'F.A.Q.'
    	@description = 'Frequently Asked Questions'
	end

	def home	
		@title      = 'Home'
    	@description = 'What would you like to do?'		
	end

	def admin	
		@title      = 'Administration'
    	@description = 'Administrative Panel'		
	end
end