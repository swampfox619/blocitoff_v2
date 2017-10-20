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
      redirect_to users_show_path(@user)
    else
      flash.now["alert"] = "We had a problem.  Please try again."
      render :new
    end
  end
  
end
