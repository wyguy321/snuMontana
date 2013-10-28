class UserEmail < ActionMailer::Base
  


  def contact(sender, subject, message, sent_at = Time.now)
  	@sender = sender
  	@message = message
  	@sent_at = sent_at.strftime("%B %e, %Y at %H:%M")
  	mail(:subject => subject)



  end



end
