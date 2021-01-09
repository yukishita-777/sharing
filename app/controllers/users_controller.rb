class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def update
    @user = User.find(current_user.id)
    @user = User.new(user_params)
    if @user.update(user_params)
      flash[:notice] = "プロフィールの更新が完了しました！"
      redirect_to :show
    else
      render "edit"
    end
  end
  
  private
  def user_params
    params.require(:user).permit(name: :name, id: current_user.id)
  end
  
  
end
