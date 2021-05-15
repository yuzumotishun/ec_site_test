class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      login user
      flash[:success] = "ログインしました。"
      redirect_to user_path(user.id)
    else
      flash.now[:danger] = "ログインできませんでした。"
      render :new
    end
  end

  def destroy
    logout
    flash[:success] = "ログアウトしました。"
    redirect_to login_path
  end
end
