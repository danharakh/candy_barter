class LineItemsController < ApplicationController
  def index
    @q = LineItem.ransack(params[:q])
    @line_items = @q.result(:distinct => true).includes(:inventory, :proposed_trade).page(params[:page]).per(10)

    render("line_items/index.html.erb")
  end

  def show
    @line_item = LineItem.find(params[:id])

    render("line_items/show.html.erb")
  end

  def new
    @line_item = LineItem.new

    render("line_items/new.html.erb")
  end

  def create
    @line_item = LineItem.new

    @line_item.inventory_id = params[:inventory_id]
    @line_item.proposed_trade_id = params[:proposed_trade_id]
    @line_item.quantity = params[:quantity]

    save_status = @line_item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/line_items/new", "/create_line_item"
        redirect_to("/line_items")
      else
        redirect_back(:fallback_location => "/", :notice => "Line item created successfully.")
      end
    else
      render("line_items/new.html.erb")
    end
  end

  def edit
    @line_item = LineItem.find(params[:id])

    render("line_items/edit.html.erb")
  end

  def update
    @line_item = LineItem.find(params[:id])

    @line_item.inventory_id = params[:inventory_id]
    @line_item.proposed_trade_id = params[:proposed_trade_id]
    @line_item.quantity = params[:quantity]

    save_status = @line_item.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/line_items/#{@line_item.id}/edit", "/update_line_item"
        redirect_to("/line_items/#{@line_item.id}", :notice => "Line item updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Line item updated successfully.")
      end
    else
      render("line_items/edit.html.erb")
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])

    @line_item.destroy

    if URI(request.referer).path == "/line_items/#{@line_item.id}"
      redirect_to("/", :notice => "Line item deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Line item deleted.")
    end
  end
end
