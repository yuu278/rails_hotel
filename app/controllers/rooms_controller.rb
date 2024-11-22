class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = user_signed_in? ? current_user.rooms.order(created_at: :desc) : Room.all.order(created_at: :desc)
  end
  
  def show
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to @room, notice: '施設が作成されました'
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @room.update(room_params)
      redirect_to @room, notice: '部屋情報が更新されました'
    else
      render :edit
    end
  end
  
  def destroy
    if @room.destroy
      redirect_to rooms_path, notice: '部屋が削除されました'
    else
      redirect_to @room, alert: '部屋の削除に失敗しました'
    end
  end
  
  def search
    @rooms = if params[:query].present? && params[:area].present?
               Room.search(params[:query]).area_search(params[:area])
             elsif params[:query].present?
               Room.search(params[:query])
             elsif params[:area].present?
               Room.area_search(params[:area])
             else
               Room.none
             end
  end
  
  private
  
  def set_room
    @room = Room.find(params[:id])
  end
  
  def room_params
    params.require(:room).permit(:name, :description, :price, :address, :image)
  end
end