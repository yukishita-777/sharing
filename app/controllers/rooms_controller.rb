class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "ルーム登録が完了しました。"
      redirect_to :root
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @rooms = @user.rooms 
  end
  
  def edit
  end

  def update
     if @room.user_id == current_user.id
     end
  end

  def destroy
  end
  
  private
  def room_params
    params.require(:room).permit(:name, :introduction, :fee, :address, :image).merge(user_id: current_user.id)
  end
end
