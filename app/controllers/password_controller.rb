 class Password < ApplicationController
  def password
  
 http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  end
end


 