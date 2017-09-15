Rails.application.routes.draw do

  resources :questions
  resources :subgenres

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

  resources :genres
  resources :users

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

end
