class ContactMailer < ActionMailer::Base
  default from: "noreplay@fau.edu"

   def send_msg(username,subject,msg)
  	@sentby = 'ihartstein'#username
    @subject = subject
    @msg = msg
  	
 	

    mail(:from => "#{@sentby}@fau.edu", :to => "ihartstein@fau.edu", :subject => "CoM Faculty Database Inquiry")
   end

end
