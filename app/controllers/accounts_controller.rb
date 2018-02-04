class AccountsController < ApplicationController
  helper_method :user

  def new
    redirect_to(profile_path) unless user.guest?
  end

  def create
    @user = Users.create(**user_params)
    if user.guest?
      render :new
    else
      Users.store_user_in_session(session: session, user: user)
      redirect_to profile_path
    end
  end

  def profile; end

private

  def user
    @user ||= current_user
  end

  def user_params
    params_as_hash(params.require(:account).permit(:email, :id, :password, :password_confirmation, :name))
  end

  def session_params
    params_as_hash(params.require(:account).permit(:email, :password))
  end
end
