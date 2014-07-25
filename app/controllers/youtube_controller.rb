class YoutubeController < ApplicationController
  require 'google/api_client'

  # Set DEVELOPER_KEY to the API key value from the APIs & auth > Credentials
  # tab of
  # Google Developers Console <https://console.developers.google.com/>
  # Please ensure that you have enabled the YouTube Data API for your project.
  DEVELOPER_KEY = ''
  YOUTUBE_API_SERVICE_NAME = 'youtube'
  YOUTUBE_API_VERSION = 'v3'

  def get_service
    client = Google::APIClient.new(
    :key => DEVELOPER_KEY,
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
        :q => song + "karaoke"
      }
      )

      videos = []

      # Add each result to the appropriate list, and then display the lists of
      # matching videos, channels, and playlists.
      search_response.data.items.each do |search_result|
        case search_result.id.kind
        when 'youtube#video'
          videos << "#{search_result.snippet.title} (#{search_result.id.videoId})"
          # videos << {title: search_result.snippet.title, ytid: search_result.id.videoId}
        end
      end
      p videos.first
      returned_video_id = videos[0].split("(").last
      video_id_string = returned_video_id.delete(")")
      p returned_video_title = videos[0].split("(").first.rstrip

    rescue Google::APIClient::TransmissionError => e
      puts e.result.body
    end
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
