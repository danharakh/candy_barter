class UsersController < ApplicationController
  def index
    # @users = User.all
    @users = User.page(params[:page]).per(10)
  end

  def show
    if params[:id].nil?
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end

  def show_inventories
    @inventory = User.find(params[:id]).inventories
  end

  def blah
    klfj
    render "propose_trade.html.erb"
  end

end
