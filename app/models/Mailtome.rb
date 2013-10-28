 # ...\models\mailtome.rb
class Mailtome < ActionMailer::Base
  def contact_message(contact)
    recipients CONTACT_RECIPIENT
    from contact.email_address
    subject "Contact from my web site"
    body['name'] = contact.name
    body['email_address'] = contact.email_address
    body['message'] = contact.message
  end
end #class