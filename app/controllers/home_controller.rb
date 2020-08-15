class HomeController < ApplicationController
  def index
    @image_items = current_user.image_feed.paginate(page: params[:page])
    @video_items = current_user.video_feed.paginate(page: params[:page])
    @audio_items = current_user.audio_feed.paginate(page: params[:page])
  end
end
