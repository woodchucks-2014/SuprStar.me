class YouTubeController < ApplicationController
  respond_to :json
  def retrieve_video_id
    #retrieve the first video from the current party
    @party = Party.find_by_id(params[:id]) #where to find id?
    @queue = @party.queue
    @current_video = @queue.shift # returns first in line
    @party.update(queue: @queue)
    render json: {url: @current_video }
  end


end
