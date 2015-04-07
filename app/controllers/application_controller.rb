class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  include TeamsHelper
  
  
  
  
  
  # global variables that are the only things we should be changing over time ... pretty self-explanatory, but these are very important so ya know
  $team_lock = false
  $current_round = 0
end
