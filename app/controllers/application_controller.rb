class ApplicationController < ActionController::Base
  require 'google/api_client'
  # protect_from_forgery with: :exception
  def destroy
    Party.find_by_id(current_party).users.destroy_all
    session.clear
      redirect_to root_path
  end
end
