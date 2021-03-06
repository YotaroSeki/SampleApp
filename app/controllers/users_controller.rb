class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[edit update index destroy following followers favorites]
  before_action :correct_user, only: %i[edit update]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
  end

  def following
    @title = 'Following'
    @current_user = User.find(params[:id])
    @follows = @current_user.following
    respond_to do |format|
      format.html { render 'show_follow' }
      format.jsonld { render 'show_follow' }
    end
  end

  def followers
    @title = 'Followers'
    @current_user = User.find(params[:id])
    @follows = @current_user.followers
    respond_to do |format|
      format.html { render 'show_follow' }
      format.jsonld { render 'show_follow' }
    end
  end

  def favorites
    @title = 'Favorites'
    @current_user = User.find(params[:id])
    @favorite_microposts = @current_user.favorite_microposts.includes(:user)
    respond_to do |format|
      format.html { render 'favorites' }
      format.jsonld { render 'favorites' }
    end
  end

  def navbar
    render 'navbar'
  end

  private

  def user_params
    params.require(:user)
      .permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to root_url unless current_user?(@user)
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
