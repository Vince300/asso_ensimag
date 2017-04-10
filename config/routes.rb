Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  # Associations list
  get 'assos' => 'assos#index', as: :assos

  # Specific asso details
  get 'asso/:id(/page/:page)' => 'assos#show',   as: :asso
  put 'asso/:id'              => 'assos#update', as: :update_asso
  get 'asso/:id/edit'         => 'assos#edit',   as: :edit_asso

  # Asso blog
  resources :blog_posts, path: 'posts'

  # Partners
  get    'partners'          => 'partners#index', as: :partners
  post   'partners'          => 'partners#create'
  put    'partners/:id'      => 'partners#update',  as: :partner
  delete 'partners/:id'      => 'partners#destroy'
  get    'partners/new'      => 'partners#new',     as: :new_partner
  get    'partners/:id/edit' => 'partners#edit',    as: :edit_partner

  # Asso events
  get 'events/calendar'              => 'events#calendar',    as: :events_calendar
  get 'asso/:id/events(/page/:page)' => 'events#asso_events', as: :asso_events
  resources :events do
    get 'page/:page', :action => :index, :on => :collection
  end

  devise_for :users, controllers: {registrations: "users/registrations", sessions: "users/sessions", passwords: "users/passwords"}, skip: [:sessions, :registrations]
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#index'

  #->Prelang (user_login:devise/stylized_paths)
  devise_scope :user do
    get    "login"   => "users/sessions#new",         as: :new_user_session
    post   "login"   => "users/sessions#create",      as: :user_session
    delete "signout" => "users/sessions#destroy",     as: :destroy_user_session

    # Disable user signup
    # get    "signup"  => "users/registrations#new",    as: :new_user_registration
    # post   "signup"  => "users/registrations#create", as: :user_registration
    put    "signup"  => "users/registrations#update", as: :update_user_registration
    get    "account" => "users/registrations#edit",   as: :edit_user_registration
  end
end
