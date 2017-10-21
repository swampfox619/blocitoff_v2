class UsersController < ApplicationController
  def show
    if current_user.nil?
      flash[:notice] = 'Please sign in before continuing'
      redirect_to welcome_index_path
    else
      @user = current_user
      @items = @user.items
    end
  end
  
end
