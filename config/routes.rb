Rails.application.routes.draw do
  # Associations list
  get 'assos' => 'asso#index', as: :assos

  # Specific asso details
  get 'asso/:id' => 'asso#show',          as: :asso
  put 'asso/:id' => 'asso#update',        as: :update_asso
  get 'asso/:id/edit'   => 'asso#edit',   as: :edit_asso
  get 'asso/:id/detail' => 'asso#detail', as: :detail_asso

  # Asso blog
  resources :blog_posts, path: 'posts'

  # Asso events
  resources :events

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
