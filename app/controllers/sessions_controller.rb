class SessionsController < ApplicationController
  helper_method :user

  def new
    redirect_to profile_path unless user.guest?
  end

  def create
    @user = Users.sign_in(session: session, **login_params)

    if user.guest?
      render :new
    else
      redirect_to profile_path
    end
  end

  def destroy
    Users.sign_out(session: session, user: user)
    redirect_to sign_in_path
  end

private

  def user
    @user ||= current_user
  end

  def login_params
    params.require(:session).permit(:email, :password).to_h.symbolize_keys
  end
end