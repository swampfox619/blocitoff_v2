class ItemsController < ApplicationController

  def new
    @item = Item.new
    @user = current_user
  end

  def create
    @item = current_user.items.build(params[:name])
    @item.name = params[:items][:name]
    if @item.save
      flash[:notice] = "Item was saved"
      respond_to do |format|
        format.html { redirect_to users_show_path(@user) }
        format.js
      end
    else
      flash.now["alert"] = "We had a problem.  Please try again."
      render :new
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    respond_to do |format|
      format.js { render :layout => false }
    end
  end
    
  
end
