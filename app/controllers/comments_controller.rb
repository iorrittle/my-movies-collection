class CommentsController < ApplicationController
  
  
  
  
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to room_path(@comment.room)  
  
    else
      @room = @comment.room
      @comments = @room.comments
      render "rooms/show" 
    end
  end
  
  def show
  end  

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, room_id: params[:room_id])
  end

end


