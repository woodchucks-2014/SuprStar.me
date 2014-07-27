class PartyController < ApplicationController
  respond_to :json

  def show
    @party = Party.find_by_id(1)
    @comments = Comment.where(party_id: @party.id)
  end

  def new
    @party = Party.new
    @user = User.new
  end

  def retrieve_video_id
    @party = Party.find_by_id(1) #where to find id?
    @queue = @party.queue
    @current_video = @queue.shift
    @party.update(queue: @queue)

    render json: {url: @current_video }
  end

  def create
    @party = Party.new(party_params)
    @user = User.new(user_params)
    if @party.save && @user.save
      redirect_to 'root'
    else
      render 'new'
    end
  end

  private
    def party_params
      params.require(:party).permit(:hash_tag)
    end

    def user_params
      params.require(:user).permit(:name, :phone_number)
    end
end
