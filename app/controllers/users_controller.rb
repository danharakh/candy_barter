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

  def accept_trade
    p = ProposedTrade.find_by({:id => params[:id].to_i})
    p.status = "Accepted"
    p.save
    redirect_to("/")
  end

  def reject_trade
    p = ProposedTrade.find_by({:id => params[:id].to_i})
    p.status = "Rejected"
    p.save
    redirect_to("/")
  end
end
