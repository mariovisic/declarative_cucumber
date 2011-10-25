class ApplicationController < ActionController::Base
  respond_to :html
  responders :flash

  protect_from_forgery
end
