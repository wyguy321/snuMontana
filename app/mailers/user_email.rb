class UserEmail < ActionMailer::Base
  
  default from: 'noreply@umtsnu.com'


 def contact(sender, subject, message, sent_at = Time.now)
  @sender = sender
  @message = message
  @sent_at = sent_at.strftime("%B %e, %Y at %H:%M")
 

  mail(:subject => subject, :to => "president.sigmanu.umt@gmail.com")

end


end
