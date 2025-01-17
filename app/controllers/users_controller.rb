class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "会員登録が完了しました"
      redirecct_to root_path
    else
      render "new"
    end
  end

  def user_params
    params.require(:user).permit(:name, :password)
  end
end
