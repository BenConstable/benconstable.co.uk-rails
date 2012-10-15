class ApplicationController < ActionController::Base
  protect_from_forgery
  helper ApplicationHelper
  helper TwitterHelper
end