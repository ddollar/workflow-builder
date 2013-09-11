class SessionsController < ApplicationController

  skip_before_filter :store_return_to

  def new
    redirect_to "/auth/heroku"
  end

  def create
    auth = request.env["omniauth.auth"]

    case auth["provider"]
    when "heroku"
      user = User.where(:uid => auth["uid"]).first || User.create!(:uid => auth["uid"])
      session[:user_id] = user.id
      session[:email] = auth["info"]["email"]
    when "github"
      current_user.try :update_attributes, :github_token => auth["credentials"]["token"]
    end

    redirect_to(session[:return_to] || "/")
  end

  # def destroy
  #   reset_session
  #   redirect_to root_url, :notice => "Signed out!"
  # end

  # def failure
  #   redirect_to root_url, :alert => "Authentication error: #{params[:message].humanize}"
  # end

end
