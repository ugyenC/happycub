class UsersController < ApplicationController
  def show
  end

  def users
    @user = User.all
  end

  def new
    @user = User.new
  end
  private

  def user_params
    params.require(:user).permit(event_ids: [])
  end
end
