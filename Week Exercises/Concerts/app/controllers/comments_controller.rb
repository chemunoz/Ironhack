class CommentsController < ApplicationController
  def create
    @concert=Concert.find params[:concert_id]
    @comment=@concert.comments.new(comment_params)

    if @comment.save
      redirect_to concert_path(@concert)
    else
      render 'new'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
    #Nos aseguramos que haya una key "entry" y si la hay esas keys de permit
  end
end
