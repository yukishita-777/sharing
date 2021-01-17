class RoomsController < ApplicationController
  
  def index
  end
  
  def search
    area = params[:area]
    keyword = params[:keyword]
    
    # 検索窓の入力状態によって処理の分岐
    if area.present? && keyword.present? #両方が入力された場合
      @rooms = Room.search1(area && keyword)
    elsif area.present? && keyword.blank? #エリアのみが入力された場合
      @rooms = Room.search2(area)
    elsif area.blank? && keyword.present? #キーワードのみが入力された場合
      @rooms = Room.search3(keyword)
    else
      @rooms = Room.search4() #入力が無い場合は全件表示
    end
  end
  
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
    @room = Room.find(params[:id])
  end
  
  def posts
    @user = User.find(current_user.id)
    @rooms = @user.rooms
  end
  
  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "ルーム名「#{@room.name}」の編集が完了しました。"
      redirect_to action: :posts
    else
      render "edit"
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "登録したルームを削除しました。"
    redirect_to action: :posts
  end
  
  private
  def room_params
    params.require(:room).permit(:name, :introduction, :fee, :address, :image).merge(user_id: current_user.id)
  end
end
