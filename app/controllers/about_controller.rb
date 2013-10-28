class AboutController < ApplicationController
 # ...\controllers\home_controller.rb
#----------------------------------------------------
# show contact form

  def contact
    @title = "Contact"
    @sender = ''
    @subject = ''
    @message = ''
  end

  def sendmail
    @sender = params[:sender]
    @subject = params[:subject]
    @message = params[:message]
    if validate(@sender, @subject, @message)
      UserEmail.contact(@sender, @subject, @message).deliver      
      flash[:success] = "Your message sent sucessfully!"      
      redirect_to about_index_path
    else

      flash.now[:error] = "Your message did not send"     

      redirect_to about_index_path
    end
  end

  private
    def validate(sender, subject, message)
      @email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      if sender.blank? || subject.blank? || message.blank?
        @error = "Message not sent: Required information not filled"
        return false
      elsif subject.length >= 50
        @error = "Message not sent: Subject must be smaller than 50 characters"
        return false
    elsif sender[@email_regex].nil?
        @error = "Message not sent: Email not valid"
        return false
      else
        return true
      end
    end
  end