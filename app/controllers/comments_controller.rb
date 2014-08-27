class CommentsController < ApplicationController


 def create
  @pit= Pit.find(params[:pit_id])
  @comment = @pit.comments.build(comments_params)
  @comment.user = current_user
  @comment.save

  redirect_to pit_path(@pit)
end

  def destroy
    @pit = Pit.find(params[:pit_id])
    @comment = @pit.comments.find(params[:id])
    @comment.destroy
    redirect_to pit_path(@pit)
end

def upvote
  @pit = Pit.find(params[:pit_id])
  @comment = @pit.comments.find(params[:comment_id])
  @comment.upvote_from current_user
  redirect_to pit_path(@pit)
end

def downvote
  @pit = Pit.find(params[:pit_id])
  @comment = @pit.comments.find(params[:comment_id])
  @comment.downvote_from current_user
  redirect_to pit_path(@pit)
end

def update
end

    


def show  
end

  private

def comments_params
    params.require(:comment).permit(:body, :user_id)
end

end
