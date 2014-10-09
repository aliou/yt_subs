class UsersController < ApplicationController
  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]

    if @user.update(secure_params)
      redirect_to root_url
    else
      redirect_to edit_user_path(@user), notice: ''
    end
  end

  private

  def secure_params
    params.require(:user).permit(:email)
  end
end
