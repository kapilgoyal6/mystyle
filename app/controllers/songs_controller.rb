class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  # GET /songs
  # GET /songs.json

  def set_fav
    @song = Song.find(params[:id])
    @song.update_attribute(:favourite, true)
    redirect_to(:back)
  end

  def unset_fav
    @song = Song.find(params[:id])
    @song.update_attribute(:favourite, false)
    redirect_to(:back)
  end

  def index
    @songs = Song.all
    @profile = Profile.find_by_user_id(current_user)
  end

  def english
    @songs = Song.where(:category => "English", :user_id => current_user).order('updated_at DESC').page(params[:page]).per(9)
    @profile = Profile.find_by_user_id(current_user)
  end

  def hindi
    @songs = Song.where(:category => "Hindi", :user_id => current_user).order('updated_at DESC').page(params[:page]).per(9)
    @profile = Profile.find_by_user_id(current_user)
  end

  def punjabi
    @songs = Song.where(:category => "Punjabi", :user_id => current_user).order('updated_at DESC').page(params[:page]).per(9)
    @profile = Profile.find_by_user_id(current_user)
  end


  # GET /songs/1
  # GET /songs/1.json
  def show
    @profile = Profile.find_by_user_id(current_user)
  end

  # GET /songs/new
  def new
    @song = Song.new
    @profile = Profile.find_by_user_id(current_user)
  end

  # GET /songs/1/edit
  def edit
    @profile = Profile.find_by_user_id(current_user)
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new(song_params)
    @profile = Profile.find_by_user_id(current_user)
    respond_to do |format|
      if @song.save
        format.html { redirect_to songs_path, notice: 'Song was successfully created.' }
        format.json { render action: 'show', status: :created, location: @song }
      else
        format.html { render action: 'new' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @song }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(:user_id, :category, :favourite, :file)
    end
end
