class InventoriesController < ApplicationController
  before_action :current_user_must_be_inventory_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_inventory_user
    inventory = Inventory.find(params[:id])

    unless current_user == inventory.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.inventories.ransack(params[:q])
      @inventories = @q.result(:distinct => true).includes(:user, :item, :line_items, :proposed_trade).page(params[:page]).per(10)

    render("inventories/index.html.erb")
  end

  def show
    @line_item = LineItem.new
    @inventory = Inventory.find(params[:id])

    render("inventories/show.html.erb")
  end

  def new
    @inventory = Inventory.new

    render("inventories/new.html.erb")
  end

  def create

    @inventory = Inventory.new

    @inventory.user_id = params[:user_id]
    @inventory.item_id = params[:item_id]
    @inventory.quantity = params[:quantity]
    @inventory.proposed_trade_id = params[:proposed_trade_id]

    save_status = @inventory.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/inventories/new", "/create_inventory"
        redirect_to("/inventories")
      else
        redirect_back(:fallback_location => "/", :notice => "Inventory created successfully.")
      end
    else
      render("inventories/new.html.erb")
    end
  end

  def edit
    @inventory = Inventory.find(params[:id])

    render("inventories/edit.html.erb")
  end

  def update
    @inventory = Inventory.find(params[:id])

    @inventory.user_id = params[:user_id]
    @inventory.item_id = params[:item_id]
    @inventory.quantity = params[:quantity]
    @inventory.proposed_trade_id = params[:proposed_trade_id]

    save_status = @inventory.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/inventories/#{@inventory.id}/edit", "/update_inventory"
        redirect_to("/", :notice => "Inventory updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Inventory updated successfully.")
      end
    else
      render("/")
    end
  end

  def destroy
    @inventory = Inventory.find(params[:id])

    @inventory.destroy

    if URI(request.referer).path == "/inventories/#{@inventory.id}"
      redirect_to("/", :notice => "Inventory deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Inventory deleted.")
    end
  end

  def propose_trade
    @target_inventory = Inventory.find_by({:id => params[:id].to_i})
  end

end
