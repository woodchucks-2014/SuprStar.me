class ApplicationController < ActionController::Base
  require 'google/api_client'

  protect_from_forgery with: :exception

  # def create
  #   send_sms('845-594-2698','Hello John')
  # end

    YOUTUBE_DEVELOPER_KEY = ENV["YOUTUBE_API_KEY"]
    YOUTUBE_API_SERVICE_NAME = 'youtube'
    YOUTUBE_API_VERSION = 'v3'

    def get_service
      client = Google::APIClient.new(
      :key => YOUTUBE_DEVELOPER_KEY,
      :authorization => nil,
      :application_name => $PROGRAM_NAME,
      :application_version => '1.0.0'
      )
      youtube = client.discovered_api(YOUTUBE_API_SERVICE_NAME, YOUTUBE_API_VERSION)

      return client, youtube
    end

    def find(song)

      client, youtube = get_service

      begin
        # Call the search.list method to retrieve results matching the specified
        # query term.
        search_response = client.execute!(
        :api_method => youtube.search.list,
        :parameters => {
          :part => 'snippet',
          :q => song + " karaoke"
        }
        )

        videos = []

        search_response.data.items.each do |search_result|
          case search_result.id.kind
          when 'youtube#video'
            videos << { :title => search_result.snippet.title,
                        :ytid => search_result.id.videoId }
          end
        end

      rescue Google::APIClient::TransmissionError => e
        puts e.result.body
      end

      return videos.first
    end

    def add_song(song)
    end

    def retrieve_from_queue
      @party = Party.find(1)
      p @party.queue.first
      @next_song = @party.queue.shift
      p @next_song
      p @party.queue
    end
end
