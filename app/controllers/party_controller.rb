class PartyController < ApplicationController
  include YouTubeHelper
  respond_to :json

  def show
    @party = Party.find(session[:party_id])
    @comments = @party.comments
    @queue = @queue = @party.queue
  end



  def create
    @party = Party.new(party_params)
    @user = User.new(user_params)
    @song = Song.new
    if @party.save && @user.save
      session[:party_id] = @party.id
      first = find(first_song[:name])
      @song = Song.create(youtube_url: first[:ytid], user_id: @user.id, party_id: @party.id, name: first[:title])
      @party.queue = []
      @queue = @party.queue << @song.serializable_hash
      @party.update(queue: @queue)
      redirect_to retrieve_party_path
    else
      flash[:notice] = "Something went wrong, please try again."
      render 'index'
    end
  end

  def retrieve_video_id
    @party = Party.find_by_id(session[:party_id]) #where to find id?
    @queue = @party.queue
    @current_video = @queue.shift
    @party.update(queue: @queue)

    render json: {url: @current_video }
  end

  def retrieve_queue
    @queue = Party.find_by_id(session[:party_id]).queue
    render json: {queue: @queue}
  end

  private
  def party_params
    params.require(:party).permit(:hash_tag)
  end

  def first_song
    params.require(:song).permit(:name)
  end

  def user_params
    params.require(:user).permit(:name, :phone_number)
  end
end
