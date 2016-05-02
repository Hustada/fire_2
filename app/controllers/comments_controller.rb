class CommentsController < ApplicationController
  

def new
end

def index
end

 def create
  @pit= Pit.find(params[:pit_id])
  @comment = @pit.comments.build(comments_params)
  @comment.user = current_user
  if @comment.save
    respond_to do |format|
      format.html { redirect_to pit_path(@pit)}
      format.js  {}
      end
    else
      flash[:notice] = "Comment can't be fucking blank"
      redirect_to pit_path(@pit)
    end
  end
  



def destroy
  @pit = Pit.find(params[:pit_id])
  @comment = @pit.comments.find(params[:id])
  @comment.destroy
    respond_to do |format|
        format.html {redirect_to pit_path(@pit)}
        format.js {}
    end
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

def edit
    @pit = Pit.find(params[:pit_id])
    @comment = @pit.comments.find(params[:id])
end

def update
    @pit = Pit.find(params[:pit_id])
    @comment = @pit.comments.find(params[:id])
  if @comment.update(comments_params)
      redirect_to pit_path(@pit)
    else
      render 'edit'
    end
  end

def destroy
  @pit = Pit.find(params[:pit_id])
  @comment = @pit.comments.find(params[:id])
if @comment.destroy
    redirect_to pit_path(@pit)
end
end
    
def show
end

  private

def comments_params
    params.require(:comment).permit(:body, :user_id)
end

end
