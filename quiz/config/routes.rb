Rails.application.routes.draw do


  post 'subgenres/:subgenre_id/questions/:id/start_newquiz', to: 'subgenres#start_newquiz', as: 'start_newquiz_link'
  post 'subgenres/:subgenre_id/questions/:id/start_resumequiz', to: 'subgenres#start_resumequiz', as: 'start_resumequiz_link'
  get 'subgenres/:subgenre_id/questions/quizindex', to: 'questions#quizindex', as: 'quiz_link'

  get 'subgenres/:subgenre_id/leaderboards', to: 'leaderboards#subindex', as: 'leaderboards_subgenre_link'
  get 'genres/:genre_id/leaderboards', to: 'leaderboards#genindex', as: 'leaderboards_genre_link'
  post 'subgenres/:subgenre_id/leaderboards', to: 'leaderboards#create', as: 'leaderboards_link_create'
  get 'subgenres/:subgenre_id/leaderboards/new', to: 'leaderboards#new', as: 'new_leaderboards_link'

  get 'questions/:question_id/options/new', to: 'options#new', as: 'new_option_link'
  get 'questions/:question_id/questions', to: 'options#index', as: 'options_link'
  post 'questions/:question_id/questions', to: 'options#create', as: 'options_link_create'

  get 'genres/:genre_id/subgenres/new', to: 'subgenres#new', as: 'new_subgenre_link'
  get 'genres/:genre_id/subgenres', to: 'subgenres#index', as: 'subgenres_link'
  post 'genres/:genre_id/subgenres', to: 'subgenres#create', as: 'subgenres_link_create'

  get 'subgenres/:subgenre_id/questions/new', to: 'questions#new', as: 'new_question_link'
  get 'subgenres/:subgenre_id/questions', to: 'questions#index', as: 'questions_link'
  post 'subgenres/:subgenre_id/questions', to: 'questions#create', as: 'questions_link_create'

  get 'welcome/index'
  root 'welcome#index'

  post 'users/:id/make_admin', to: 'users#make_admin', as: 'make_admin'
  post 'users/:id/remove_admin', to: 'users#remove_admin', as: 'remove_admin'
  get 'users/:id/update_credentials', to: 'users#update_credentials', as: 'update_credentials'

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  resources :options
  resources :leaderboards
  resources :questions
  resources :subgenres
  resources :genres
  resources :users

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

end
