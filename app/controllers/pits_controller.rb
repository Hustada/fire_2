class PitsController < ApplicationController
  before_action :current_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

def new
  @pit = Pit.new
end

def index
  @pit = Pit.all
  @user = User.find_by(params[:id])
  
  @pits = Pit.order('created_at DESC').paginate(:per_page => 2, :page => params[:page])
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


private

def correct_user
    @pit = current_user.pits.find_by_id(params[:id])
    redirect_to root_path if @pit.nil?
  end

def pit_params
    params.require(:pit).permit(:topic, :summary, :image, :video_url, :author, :user_id)
end

end
