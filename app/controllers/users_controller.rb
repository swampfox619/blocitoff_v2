class UsersController < ApplicationController
  def show
    if current_user == nil
      flash[:notice] = 'Please sign in before continuing'
      redirect_to welcome_index_path
    end
    @user = User.find_by(params[:id])
    @items = @user.items
  end
end
