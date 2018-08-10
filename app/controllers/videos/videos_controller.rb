class Videos::VideosController < ApplicationController

  before_action :set_user, except: :show
  before_action :authenticate_user!, except: :show
  before_action :authenticate_owner, except: :show

  def show
    @video = Video.friendly.find(params[:id])
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    @video.user_id = @user.id
    if @video.save
      flash[:notice] = "You just created " + @video.title + "!"
      redirect_to video_path(@video)
    else
      flash.now[:alert] = 'Whoa! Something went wrong!'
      render 'new'
    end
  end

  def edit
    @video = Video.friendly.find(params[:id])
  end

  def update
    @video = Video.friendly.find(params[:id])
    if @video.update_attributes(video_params)
      flash[:notice] = "Good job!"
      redirect_to video_path(@video)
    else
      flash.now[:alert] = 'Bad job!'
      render 'edit'
    end
  end

  def destroy
    @video = Video.friendly.find(params[:id]).destroy
    redirect_to root_url
    flash[:notice] = "Delete successful."
  end

  private

    def set_user
      @user = current_user
    end


    def authenticate_owner
      @user = User.friendly.find(1)
      unless current_user == @user
        redirect_to root_url
      end
    end

    def video_params
      params.require(:video).permit(:title, :image, :video, :description)
    end

end