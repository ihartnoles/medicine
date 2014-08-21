class ContactMailer < ActionMailer::Base
  default from: "noreply@fau.edu"

   def send_msg(username,subject,msg)
  	@username =  username
    @subject = subject
    @msg = msg
  	
 	

    mail(:from => "#{@username}@fau.edu", :to => "eneedelm@fau.edu", :subject => "CoM Faculty Database - #{@subject}")
   end

end
