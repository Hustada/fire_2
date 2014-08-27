module PitsHelper

  def convincing_pit
    @pit = Pit.find(params[:id])
    if @pit.get_likes.size.to_i > 5
      @pit.get_likes.size.to_i
    else
      (0)
    end
  end


  def convincing_response
    @pit = Pit.find(params[:comment][:id])
    @comments = @pit.comments.find(params[:comment])
    if @comment.get_likes.size.to_i > 5
       @comment.get_likes.size.to_i
    else
      (0)
    end
  end


end
