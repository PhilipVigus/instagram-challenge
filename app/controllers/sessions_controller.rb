class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:login][:username])

    # the &. is safe navigation. authenticate will only be called if user exists
    # if not, the predicate will be false
    if user&.authenticate(params[:login][:password])
      session[:user_id] = user.id.to_s
      redirect_to pictures_path, notice: 'Welcome'
    else
      redirect_to '/login', alert: 'Unable to log in - invalid username or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: 'Successfully logged out'
  end
end
