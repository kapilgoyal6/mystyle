class HomeController < ApplicationController
  def index
  	if !current_user
  		redirect_to root_url
	end
	@profile = Profile.find_by_user_id(current_user)
	@videos = Video.where(:favourite => true , :user_id => current_user).order('updated_at DESC').limit(3)
	@pictures = Picture.where(:favourite => true , :user_id => current_user).order('updated_at DESC').limit(6)
  @songs = Song.where(:favourite => true , :user_id => current_user).order('updated_at DESC').limit(4)

  end

  def all
    @profile = Profile.find_by_user_id(current_user)
    render :layout => 'application'
    
  end

end
