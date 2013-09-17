class ApplicationController < ActionController::Base
  protect_from_forgery

  helper :all # Surya - This stmt will tell Rails to make all helpers methods available to all views
end
