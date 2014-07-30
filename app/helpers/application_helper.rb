module ApplicationHelper

  def current_party
    @current_party ||= Party.find(session[:party_id]) if session[:party_id]
  end

end
