class StaticPagesController < ApplicationController
	def faq
		@title      = 'F.A.Q.'
    	@description = 'Frequently Asked Questions'
	end
end