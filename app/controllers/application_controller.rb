class ApplicationController < ActionController::Base
  include ApplicationHelper
  require 'google/api_client'
  # protect_from_forgery with: :exception
  def destroy
    if current_party
      Party.find_by_id(current_party).users.destroy_all
      session.clear
    end
      redirect_to root_path 
  end
end
