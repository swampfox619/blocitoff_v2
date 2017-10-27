class ItemsController < ApplicationController

  def new
    @item = Item.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @item = current_user.items.build(params[:name])
    @item.name = params[:items][:name]
    @item.order = current_user.items.count + 1;
    if @item.save
      flash[:notice] = "Item was saved"
      respond_to do |format|
        format.js
      end
    else
      flash.now["alert"] = "We had a problem.  Please try again."
      render :new
    end
  end
  
  def update
    @item = Item.find(params[:id])
    @item.assign_attributes(item_params)
    @item.save
    respond_to do |format|
      format.js
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.js { render :layout => false }
    end
  end
    
  private
  
  def item_params
    params.require(:item).permit(:name, :order, :user_id)
  end
end
