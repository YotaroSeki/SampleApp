class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in(@user)
      if params[:session][:remember_me] == '1'
        remember(@user)
      else
        forget(@user)
      end
      redirect_back_or(@user)
    else
      flash.now[:danger] = 'アドレスとパスワードの組み合わせが正しくありません'
      render('new')
    end
  end

  def destroy
    log_out if logged_in?
  end
end
