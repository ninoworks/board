class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in
      redirecct_to root_path
    else
      flash.now[:danger] = "名前またはパスワードが無効です"
      render "new"
    end
  end

  def destroy
    log_out
    redirecct_to root_path
  end

  private

  def log_in(user)
    session[:user_id] = user_id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
