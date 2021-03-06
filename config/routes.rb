Rails.application.routes.draw do
  root to: 'party#index'

  match 'signout', to: 'application#destroy', as: 'signout', via: [:get, :post]

  get 'receive_sms' => "notification#receive_sms", :as => :receive_sms
  post 'receive_sms' => "notification#receive_sms"

  get 'retrieve_video_id' => "party#retrieve_video_id"
  post 'retrieve_video_id' => "party#retrieve_video_id"

  get 'about_us' => "party#about_us"
  get 'instructions' => "party#instructions"
  get 'team' => "party#team"
  get 'retrieve_next_video_id' => "party#retrieve_next_video_id"

  get 'retrieve_comments' => "comment#retrieve_comments"

  get 'retrieve_queue' => "party#retrieve_queue"
  get 'retrieve_party' => "party#show"

  resources :party, only: [:show, :new, :create, :retrieve_video_id]

end
