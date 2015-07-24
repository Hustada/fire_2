class JoinablesController < ApplicationController
  
  def index
    @joinables = Joinable.all
  end

  def show
    @joinable = Joinable.find(params[:id])
  end


  def create
   @joinable = current_user.joinables.create(joinable_params)
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

private
 

def joinable_params
  params.require(:joinable).permit(:pit_id, :user_id, :tag_list)
end