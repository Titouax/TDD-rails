class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:theclub]

  def home
  end

  def theclub
  end

  private

  def user_params
    params.require(:user).permit(:email, :password,
                                 :password_confirmation)
  end

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to("/") unless current_user?(@user)
  end
end
