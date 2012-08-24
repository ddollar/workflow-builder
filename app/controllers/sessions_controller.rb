class SessionsController < ApplicationController

  def new
    redirect_to "/auth/heroku"
  end

  def create
    auth = request.env["omniauth.auth"]
    user = User.where(:uid => auth["uid"]).first || User.create!(:uid => auth["uid"])
    session[:user_id] = user.id
    session[:email] = auth["info"]["email"]

    redirect_to "/"
  end

  # def destroy
  #   reset_session
  #   redirect_to root_url, :notice => "Signed out!"
  # end

  # def failure
  #   redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  # end

end
