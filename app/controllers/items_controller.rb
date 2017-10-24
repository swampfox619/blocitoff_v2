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
    @item.update_attributes(params[:item][:order])
    @item.save
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.js { render :layout => false }
    end
  end
    
  
end
