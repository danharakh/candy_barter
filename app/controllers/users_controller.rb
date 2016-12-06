class UsersController < ApplicationController
  before_filter :login_required, :except => [:index]

  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    if params[:id].nil?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end

end
