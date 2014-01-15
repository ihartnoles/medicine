class ContactController < ApplicationController
  
  def index
  	@title      = 'Contact Us'
    @description = 'Need assistance? Please fill out the form below.'
    @contact = Contact.new

  	respond_to do |format|
      format.html # index.html.erb      
    end

  end

  def sendcontact
  	@title      = 'Success!'
    @description = 'Inquiry submitted!'
    @username = 'ihartstein'
  	  	
  	@contact = Contact.new(params[:contact])
   	
   	respond_to do |format|
	   	if @contact.save    	 
	    	 ContactMailer.send_msg(@username, params[:subject] , params[:msg]).deliver
	    	 format.html
	    else
	    	 format.html {  render action: "index" }
	    end
	end

  end

end
