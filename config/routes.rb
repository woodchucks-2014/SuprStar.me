Rails.application.routes.draw do
  root to: 'party#index'

  get 'receive_sms' => "notification#receive_sms", :as => :receive_sms
  post 'receive_sms' => "notification#receive_sms"

  get 'retrieve_video_id' => "party#retrieve_video_id"
  post 'retrieve_video_id' => "party#retrieve_video_id"

  get 'retrieve_comments' => "comment#retrieve_comments"
  post 'retrieve_comments' => "comment#retrieve_comments"

  get 'retrieve_queue' => "party#retrieve_queue"

  get 'retrieve_party' => "party#show"

#add only actions we need
  resources :comment
  resources :party

end
