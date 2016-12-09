class ProposedTradesController < ApplicationController
  before_action :current_user_must_be_proposed_trade_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_proposed_trade_user
    proposed_trade = ProposedTrade.find(params[:id])

    unless current_user == proposed_trade.proposer
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @proposed_trades = current_user.sent_proposals.page(params[:page]).per(10)

    render("proposed_trades/index.html.erb")
  end

  def show
    @comment = Comment.new
    @line_item = LineItem.new
    @inventory = Inventory.new
    @proposed_trade = ProposedTrade.find(params[:id])

    render("proposed_trades/show.html.erb")
  end

  def new
    @proposed_trade = ProposedTrade.new

    render("proposed_trades/new.html.erb")
  end

  def create

    # create propose new trade
    # create new line item 1
    # create new line item 2
    # redirect home
    @proposed_trade = ProposedTrade.new

    @proposed_trade.status = 'Pending'
    @proposed_trade.star_rating = nil
    @proposed_trade.proposer_id = current_user.id
    @proposed_trade.recipient_id = Inventory.find_by({:id =>params[:target_inventory].to_i}).user.id

    save_status_proposed_trade = @proposed_trade.save

    @line_item_1 = LineItem.new

    @line_item_1.inventory_id = params[:target_inventory].to_i
    @line_item_1.proposed_trade_id = @proposed_trade.id
    @line_item_1.quantity = 1

    save_status_line_item_1 = @line_item_1.save

    @line_item_2 = LineItem.new

    @line_item_2.inventory_id = params[:item_id].to_i
    @line_item_2.proposed_trade_id = @proposed_trade.id
    @line_item_2.quantity = 1

    save_status_line_item_2 = @line_item_2.save

    redirect_to("/")

    # if save_status == true
    #   referer = URI(request.referer).path
    #
    #   case referer
    #   when "/proposed_trades/new", "/create_proposed_trade"
    #     redirect_to("/proposed_trades")
    #   else
    #     redirect_back(:fallback_location => "/", :notice => "Proposed trade created successfully.")
    #   end
    # else
    #   render("proposed_trades/new.html.erb")
    # end

  end

  def edit
    @proposed_trade = ProposedTrade.find(params[:id])

    render("proposed_trades/edit.html.erb")
  end

  def update
    @proposed_trade = ProposedTrade.find(params[:id])

    @proposed_trade.status = params[:status]
    @proposed_trade.star_rating = params[:star_rating]
    @proposed_trade.proposer_id = params[:proposer_id]
    @proposed_trade.recipient_id = params[:recipient_id]

    save_status = @proposed_trade.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/proposed_trades/#{@proposed_trade.id}/edit", "/update_proposed_trade"
        redirect_to("/proposed_trades/#{@proposed_trade.id}", :notice => "Proposed trade updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Proposed trade updated successfully.")
      end
    else
      render("proposed_trades/edit.html.erb")
    end
  end

  def destroy
    @proposed_trade = ProposedTrade.find(params[:id])

    @proposed_trade.destroy

    if URI(request.referer).path == "/proposed_trades/#{@proposed_trade.id}"
      redirect_to("/", :notice => "Proposed trade deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Proposed trade deleted.")
    end
  end

end
