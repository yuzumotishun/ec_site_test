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
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to user
    else
      flash[:alert] = "ユーザー情報を更新できませんでした。"
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation, :last_name, :first_name, :zipcode, :prefecture, :municipality, :address, :apartments, :email, :phone_number)
    end
end
