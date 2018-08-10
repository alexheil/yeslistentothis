class Users::VotesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user
  
  def create
    @video = Video.friendly.find(params[:video_id])
    @vote = Vote.new
    @vote.user_id = @user.id
    @vote.video_id = @video.id
    if @vote.save
      redirect_to video_path(@video)
      # respond_to do |format|
      #   format.html { redirect_to video_path(@video) }
      #   format.js { render :action => "votes" }
      #   flash.now[:notice] = "You have successfully voted #{@video.title}!"
      # end
    else
      redirect_to video_path(@video)
      flash[:alert] = "You have failed."
    end
  end

  def destroy
    @video = Video.friendly.find(params[:video_id])
    @user.unvote(@event)
    redirect_to video_path(@video)
    # respond_to do |format|
    #   format.html { redirect_to video_path(@video) }
    #   format.js { render :action => "votes" }
    #   flash.now[:notice] = "You unvoteded #{@video.title}!"
    # end
  end

  private

    def set_user
      @user = current_user
    end

  
end