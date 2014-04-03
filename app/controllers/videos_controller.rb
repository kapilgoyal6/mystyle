class VideosController < ApplicationController
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json

  def set_fav
    @video = Video.find(params[:id])
    @video.update_attribute(:favourite, true)
    redirect_to(:back)
  end

  def unset_fav
    @video = Video.find(params[:id])
    @video.update_attribute(:favourite, false)
    redirect_to(:back)
  end


  def index
    @videos = Video.where(:user_id => current_user).order('updated_at DESC').page(params[:page]).per(9)
    @profile = Profile.find_by_user_id(current_user)
  end

  def english
    @videos = Video.where(:category => "English", :user_id => current_user).order('updated_at DESC').page(params[:page]).per(9)
    @profile = Profile.find_by_user_id(current_user)
  end

  def hindi
    @videos = Video.where(:category => "Hindi", :user_id => current_user).order('updated_at DESC').page(params[:page]).per(9)
    @profile = Profile.find_by_user_id(current_user)
  end

  def punjabi
    @videos = Video.where(:category => "Punjabi", :user_id => current_user).order('updated_at DESC').page(params[:page]).per(9)
    @profile = Profile.find_by_user_id(current_user)
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @profile = Profile.find_by_user_id(current_user)
  end

  # GET /videos/new
  def new
    @video = Video.new
    @profile = Profile.find_by_user_id(current_user)
  end

  # GET /videos/1/edit
  def edit
    @profile = Profile.find_by_user_id(current_user)
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)
    # Video.user_id = current_user.id

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @video }
      else
        format.html { render action: 'new' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @video }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
      # Profile.save(:user_id => current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:user_id, :category, :favourite, :url)
    end
end
