class PitsController < ApplicationController
  before_action :current_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

def new
  @pit = Pit.new
end

def index
   if params[:tag]
    @pit = Pit.tagged_with(params[:tag])
    @user = User.find_by(params[:id])
    @pits = Pit.paginate(page: params[:page])
  else
    @pit = Pit.all
    @user = User.find_by(params[:id])
    @pits = Pit.paginate(page: params[:page])
  end
end

def create
    @pit = current_user.pits.create(pit_params)
    @pits = Pit.order('created_at ASC')
      respond_to do |format|
        format.html { redirect_to @pit}
        format.js  {}
  end
end
    
def show
 @pit = Pit.find(params[:id])
 @user = User.find_by(params[:user_id])
 @pits = @user.pits
end

def edit
  @pit = Pit.find(params[:id])
end

def update
   @pit = Pit.find(params[:id])
   if @pit.update(pit_params)
     redirect_to @pit
   else
    render :edit
   end
end

def destroy
  @pit = Pit.find(params[:id])
  @pit.destroy
  respond_to do |format|
        format.html { redirect_to @pit }
        format.js {}
  end
end


def upvote
  @pit = Pit.find(params[:pit_id])
  @pit.upvote_from current_user
  redirect_to pit_path(@pit)
end

def downvote
  @pit = Pit.find(params[:pit_id])
  @pit.downvote_from current_user
  redirect_to pit_path(@pit)
end

def tag_cloud
  @tags = Pit.tag_counts_on(:tags)
end


def positive_response
  
end

private

def correct_user
  @pit = current_user.pits.find_by_id(params[:id])
  redirect_to root_path if @pit.nil?
end

def pit_params
    params.require(:pit).permit(:topic, :summary, :image, :video_url, :author, :user_id, :tag_list)
end

end
