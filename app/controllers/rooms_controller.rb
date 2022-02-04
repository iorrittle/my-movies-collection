class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end  

  def show 
    @room = Room.find(params[:id])
    @comment = Comment.new
    @comments = @room.comments.includes(:user)

  end

  private

  def room_params
    params.require(:room).permit(:image, :title, :director, :starring, :genre_id, :public_year_id)
  end


end