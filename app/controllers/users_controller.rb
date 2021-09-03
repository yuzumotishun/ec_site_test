class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.user_classification_id = 1 # 今はユーザー種別が購入者となるようデフォルトで設定している
    if @user.save
      flash[:success] = "ユーザーを登録しました。こちらからログインしてください。"
      redirect_to login_path
    else
      flash.now[:error] = "ユーザー登録に失敗しました。入力内容をもう一度お確かめください。"
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.email == "guest@example.com"
      flash[:danger] = "ゲストユーザー情報の再設定はできません。"
      return redirect_to edit_user_path
    end

    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザー情報を更新できませんでした。"
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy!
    flash[:success] = "ユーザーデータが削除されました。"
    redirect_to root_path
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :last_name, :first_name, :zipcode, :prefecture, :municipality, :address, :apartments,
                                   :company_name, :email, :phone_number, :image)
    end
end
