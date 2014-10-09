class SessionsController < ApplicationController

  skip_before_filter :authenticate!

  # Session creation: view should only redirect to '/auth/twitter'
  def new
  end

  # Create a session, if the user doesn't exist we create it.
  def create
    auth = request.env["omniauth.auth"]
    user = User.where(provider: auth['provider'], uid: auth['uid'].to_s).first

    if user.nil?
      user = User.create_with_omniauth(auth)
      session[:user_id] = user.id
      redirect_to edit_user_path(user)
    else
      reset_session
      session[:user_id] = user.id
      redirect_to root_url, notice: 'You have been signed in.'
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: 'You have been signed out.'
  end

  def failure
    redirect_to root_url,
      notice: "An error occured: #{params[:message].humanize}."
  end
end
