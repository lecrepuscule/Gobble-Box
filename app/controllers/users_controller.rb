class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to sessions_new_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :gender, :age, :weight, :height)
  end
  
end
