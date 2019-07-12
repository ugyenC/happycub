class UsersController < BaseController
  def show

  end
  def index

  end
  def users
    @user = User.all
  end
  def new
    @user = User.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "User successfully edited."
      redirect_to usershow_path
    else
      flash.now[:error] = "User not edited."
      format.html{ render :edit }
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "User successfully deleted."
      redirect_to usershow_path
    else
      flash.now[:error] = "User not deleted"
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :fname,
      :lname,
      :date_of_birth,
      :is_female?,
      :email,
      :avatar
    )
  end
  def authorize_admin
    current_user.admin?
  end
end
