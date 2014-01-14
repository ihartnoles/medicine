class ContactController < ApplicationController
  
  def index
  	@title      = 'Contact Us'
    @description = 'Need assistance? Please fill out the form below.'

  	respond_to do |format|
      format.html # index.html.erb      
    end

  end

  def sendcontact
  	@title      = 'Success!'
    @description = 'Inquiry submitted!'
    @username = 'ihartstein'
  	  	
  	@contact = Contact.new(:sentby => @username, :subject => params[:subject], :msg => params[:msg])
    @contact.save

    ContactMailer.send_msg(@username,@subject,@msg).deliver
  end

end
