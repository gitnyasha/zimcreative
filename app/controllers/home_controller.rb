class HomeController < ApplicationController
  before_action :authenticate_user

  def index
    @image_items = current_user.image_feed.paginate(page: params[:page])
    @video_items = current_user.video_feed.paginate(page: params[:page])
    @audio_items = current_user.audio_feed.paginate(page: params[:page])
  end
end
