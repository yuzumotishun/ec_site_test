class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      redirect_to user_path(user), notice: "ユーザー情報を更新しました。"
    else
      redirect_to edit_user_path(user), alert: "ユーザー情報を更新できませんでした。"
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :last_name, :first_name, :zipcode, :prefecture, :municipality, :address, :apartments, :email, :phone_number)
    end
end
