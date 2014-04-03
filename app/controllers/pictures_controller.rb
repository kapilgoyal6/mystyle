class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  # GET /pictures
  # GET /pictures.json

  def set_fav
    @picture = Picture.find(params[:id])
    @picture.update_attribute(:favourite, true)
    redirect_to(:back)
  end

  def unset_fav
    @picture = Picture.find(params[:id])
    @picture.update_attribute(:favourite, false)
    redirect_to(:back)
  end


  def index
    @pictures = Picture.where(:user_id => current_user).order('updated_at DESC')#.page(params[:page]).per(9)
    @profile = Profile.find_by_user_id(current_user)
  end

  def personal
    @pictures = Picture.where(:category => "Personal", :user_id => current_user).order('updated_at DESC').page(params[:page]).per(9)
    @profile = Profile.find_by_user_id(current_user)
  end

  def family
    @pictures = Picture.where(:category => "Family", :user_id => current_user).order('updated_at DESC').page(params[:page]).per(9)
    @profile = Profile.find_by_user_id(current_user)
  end

  def friends
    @pictures = Picture.where(:category => "Friends", :user_id => current_user).order('updated_at DESC').page(params[:page]).per(9)
    @profile = Profile.find_by_user_id(current_user)
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @profile = Profile.find_by_user_id(current_user)
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
    @profile = Profile.find_by_user_id(current_user)
  end

  # GET /pictures/1/edit
  def edit
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = Picture.new(picture_params)

      if @picture.save
        # redirect_to 'javascript:history.go(-2)'
        redirect_to pictures_path
        # format.json { render action: 'show', status: :created, location: @picture }
      else
        render action: 'new'
        # format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @picture }
      else
        format.html { render action: 'edit' }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = Picture.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def picture_params
      params.require(:picture).permit(:user_id, :category, :favourite, :image)
    end
end
