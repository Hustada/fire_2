class JoinablesController < ApplicationController
  
  def index
    @joinables = Joinable.all
  end

  def show
    @joinable = Joinable.find(params[:id])
    @pit_members = @joinable.users
    @user = User.find(param[:id]) if signed_in?

  end


  


private
 

def joinable_params
  params.require(:joinable).permit(:pit_id, :user_id)
end