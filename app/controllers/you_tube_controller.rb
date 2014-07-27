class YouTubeController < ApplicationController
  respond_to :json

  def retrieve_video_id
    @party = Party.find_by_id(params[:id]) #where to find id?
    @queue = @party.queue
    @current_video = @queue.shift
    @party.update(queue: @queue)
    render json: {url: @current_video }
  end
  
end
