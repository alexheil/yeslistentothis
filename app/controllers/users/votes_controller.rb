class Users::VotesController < ApplicationController

  before_action :authenticate_user!
  
  def create
    @city = Video.friendly.find(params[:city_id])
    @vote = Vote.new
    @vote.user_id = @user.id
    if @vote.save
      redirect_to video_path(@city)
      # respond_to do |format|
      #   format.html { redirect_to city_event_path(@city, @event) }
      #   format.js { render :action => "rsvps" }
      #   flash.now[:notice] = "You have successfully rsvped #{@event.title}!"
      # end
    else
      redirect_to video_path(@city, @event)
      flash[:alert] = "You have failed."
    end
  end

  def destroy
    @city = Video.friendly.find(params[:city_id])
    @user.unvote(@event)
    redirect_to video_path(@city)
    # respond_to do |format|
    #   format.html { redirect_to city_event_path(@city, @event) }
    #   format.js { render :action => "rsvps" }
    #   flash.now[:notice] = "You unrsvped #{@event.title}!"
    # end
  end

  private

    def set_user
      @user = current_user
    end

  
end