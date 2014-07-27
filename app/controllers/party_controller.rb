class PartyController < ApplicationController
  respond_to :json

  def show
    @party = Party.find_by_id(session[:party_id])
    @comments = Comment.where(party_id: @party.id)
  end

  def new
    @party = Party.new
    @user = User.new
  end

  def create
    p @party = Party.new(party_params)
    p @user = User.new(user_params)
    if @party.save && @user.save
      session[:party_id] = @party.id
      redirect_to 'party#show'
    else
      flash[:notice] = "Something went wrong, please try again."
      render 'new'
    end
  end

  def retrieve_video_id
    @party = Party.find_by_id(1) #where to find id?
    @queue = @party.queue
    @current_video = @queue.shift
    @party.update(queue: @queue)

    render json: {url: @current_video }
  end


  private
    def party_params
      params.require(:party).permit(:hash_tag)
    end

    def user_params
      params.require(:user).permit(:name, :phone_number)
    end
end
