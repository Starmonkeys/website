Website::Application.routes.draw do

  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "projects#index"
  resources :users
  resources :sessions
  resources :projects do
  #resources :projects, :has_many => [:tasks] do
    resources :tasks
  end
end
