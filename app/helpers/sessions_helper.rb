module SessionsHelper
  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.delete(:user_id)
    @current_user = nil # rubocop:disable Rails/HelperInstanceVariable
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "ログインしてください"
      redirect_to login_path
    end
  end

  def correct_user
    user = User.find(params[:id])
    unless user == current_user
      flash[:danger] = "他人の情報にアクセスすることはできません。"
      redirect_to root_path
    end
  end
end
