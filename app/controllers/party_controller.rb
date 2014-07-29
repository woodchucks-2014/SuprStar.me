class PartyController < ApplicationController
  include YouTubeHelper
  respond_to :json
  def index
    @party = Party.new
    @user = User.new
    @song = Song.new
  end

  def show
    @party = Party.find(session[:party_id])
    @comments = @party.comments
    @queue = @queue = @party.queue
  end

  def create
    @party = Party.new(party_params)
    @user = User.new(user_params)
    @song = Song.new(first_song)
    if @party.save && @user.save
      @user.update(phone_number: "+1" + @user.phone_number)
      session[:party_id] = @party.id
      p "-"* 100
      p first = find(first_song[:name])
      p first[:title]
      p @song = Song.create(name: first[:title], youtube_url: first[:ytid], user_id: @user.id, party_id: @party.id)
      p "-"* 100
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

    render json: @current_video, :callback => 'currentVideo'
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
