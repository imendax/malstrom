MSSD::Application.routes.draw do

  get 'samples/list'

  get 'feeds/list'

  get 'feeds/new_feed'

  post 'feeds/add_feed' => "feeds#create"
  resources :add_feed, :controller => "feeds"

  get 'feeds/run_feed' => "feeds#run_feed"
  resources :run_feed, :controller => "feeds"

  get 'feeds/delete_feed' => "feeds#delete_feed"
  resources :delete_feed, :controller => "feeds"

  get 'search/indicators'

  get 'search/index'

  post 'search/index'

  post 'search/indicators' => "search#index"

  get "samples/list/_samplelist" => 'samples#samplelist', :as => :samples_samplelist
  resources :samplelist, :controller => "samples"

  get "samples/list/_yara" => 'samples#yara', :as => :samples_yara
  resources :yara, :controller => "samples"

  get "samples/list/_upload" => 'samples#upload', :as => :samples_upload
  resources :upload, :controller => "samples"

  post "samples/list/_upload" => "samples#upload_malz"

  get "samples/new_yara" => "samples#new_yara"

  post "samples/save_sig" => "samples#process_sig"

  root :to => "home#index"
  devise_for :users, :path_names => {:sign_in => "login", :sign_out => "logout"}, :path => "d"
  resources :users
  namespace :admin do
    get '/' => 'users#index'
    resources :users
  end
end