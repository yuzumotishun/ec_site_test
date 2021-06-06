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

  def guest_login
    user = guest
    login user
    flash[:success] = "ゲストユーザーとしてログインしました。"
    redirect_to root_path
  end

  def guest
    User.find_or_create_by!(email: "guest@example.com") do |user|
      user.id = 10000,
      user.last_name = "ようこそ",
      user.first_name = "ゲスト",
      user.zipcode = "123-4567",
      user.prefecture = "東京",
      user.municipality = "杉並区",
      user.address = "1-2-3",
      user.apartments = "ルーム303",
      user.phone_number = "08012345678",
      user.company_name = "株式会社 葦原",
      user.user_classification_id = 1,
      user.password =  "password"
  def guest_user
    if params[:user][:email].downcase == "guest@example.com"
      flash[:danger] = "ゲストユーザー情報の再設定はできません。"
      redirect_to root_path
    end
  end
end
