class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception 
  def hello
    render html: "This made me rage, but no as the gitlab question.\n Mza7a or Moz7a it doesn't matther"
  end
end
