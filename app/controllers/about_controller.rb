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

      flash[:error] = "Your message did not send, please make sure all fields are appropriately filled out." 

      redirect_to about_index_path
    end
  end

  private
    def validate(sender, subject, message)
      @email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      if sender.blank? || subject.blank? || message.blank?
      
        return false
    elsif sender[@email_regex].nil?
       
        return false
      else
        return true
      end
    end
  end