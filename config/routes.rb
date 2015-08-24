WellnessTracker::Application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root :to => "pages#index"

  resources :activity_logs do
    member do
      get 'copy'
      post 'create_copy'
    end
  end

  resources :teams do
    member do
      post 'join'
      post 'leave'
      post 'lead'
    end
  end
  
  get '/leaderboard' => 'pages#leaderboard'

end
