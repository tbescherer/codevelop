class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?

  private
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def signed_in?
    !!current_user
  end

  def sign_in(user)
    @current_user = user
    session[:session_token] = user.reset_token!
  end

  def sign_out
    current_user.try(:reset_token!)
    session[:session_token] = nil
  end

  def require_signed_in!
    redirect_to new_session_url unless signed_in?
  end

  def push_message(message)
    user_one_id = message.conversation.user_one_id
    user_two_id = message.conversation.user_two_id
    if user_one_id == current_user.id
      recipient_id = user_two_id
    else
      recipient_id = user_one_id
    end
    Pusher.trigger("user_#{recipient_id}_messages", 'new_message', message.to_json)
  end
end
